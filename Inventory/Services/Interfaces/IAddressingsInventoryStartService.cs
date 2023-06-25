﻿using Inventory.Models;
using ReflectionIT.Mvc.Paging;

namespace Inventory.Services.Interfaces
{
    public interface IAddressingsInventoryStartService : IGeralService
    {
        Task<PagingList<AddressingsInventoryStart>> GetAddressingsStockTakingsPagingAsync(int inventaryStartId, string filter, int pageindex = 1, string sort = "Id");
        Task CreateAddressingsStockTakingAsync(int inventoryStartId);
        Task<AddressingsInventoryStart> GetAddressingsStockTakingAddressingByIdAsync(int addressingId);
        Task<bool> SetAddressingCountRealizedTrueAsync(int addressingId);
    }
}
