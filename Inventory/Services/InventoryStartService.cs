﻿using Inventory.Data;
using Inventory.Models;
using Inventory.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using ReflectionIT.Mvc.Paging;

namespace Inventory.Services
{
    public class InventoryStartService : GeralService, IInventoryStartService
    {
        private readonly InventoryContext _context;
        private readonly IAddressingsStockTakingService _addressingsStockTakingService;
        private readonly IAddressingService _addressingService;

        public InventoryStartService(InventoryContext context, IAddressingsStockTakingService addressingsStockTakingService, IAddressingService addressingService) : base(context)
        {
            _context = context;
            _addressingsStockTakingService = addressingsStockTakingService;
            _addressingService = addressingService;
        }

        public async Task CreateInventoryStartAsync(InventoryStart inventoryStart)
        {
            var result = await _context.InventoryStart.AddAsync(inventoryStart);
            await _context.SaveChangesAsync();
            await _addressingsStockTakingService.CreateAddressingsStockTakingAsync(result.Entity.Id);
        }

        public async Task<PagingList<InventoryStart>> GetAllInventoryStartsAsync(string filter, int pageindex = 1, string sort = "InventoryStartDate")
        {
            var result = _context.InventoryStart.Include(l => l.Addressings)
                                      .ThenInclude(l => l.Addressing)
                                      .AsNoTracking()
                                      .AsQueryable();

            if (!string.IsNullOrWhiteSpace(filter))
            {
                result = result.Where(p => p.Addressings.Any(a => a.Addressing.Name.ToLower().Contains(filter.ToLower())));
            }

            var model = await PagingList.CreateAsync(result, 10, pageindex, sort, "InventoryStartDate");
            model.RouteValue = new RouteValueDictionary { { "filter", filter } };

            return model;
        }

        public async Task<InventoryStart> GetInventoryStartByIdAsync(int id)
        {
            return await _context.InventoryStart.Include(l => l.Addressings).ThenInclude(il => il.Addressing).FirstOrDefaultAsync(m => m.Id == id);
        }

        public async Task<InventoryStart> GetInventoryStartByAddressingAsync(int addressingId)
        {
            var addressing = await _addressingService.GetAddressingByIdAsync(addressingId);

            var inventoryStart = await _context.InventoryStart.Include(l => l.Addressings)
                                                              .ThenInclude(il => il.Addressing)
                                                              .FirstOrDefaultAsync(i => i.IsCompleted != true);
            return inventoryStart;
        }
    }
}
