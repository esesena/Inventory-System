﻿using Inventory.Models;
using ReflectionIT.Mvc.Paging;

namespace Inventory.Services.Interfaces
{
    public interface IWarehouseService : IGeralService
    {
        IEnumerable<Warehouse> Warehouses { get; }
        Task<Warehouse> GetWarehouseByName(string warehouseName);
        Task<Warehouse> GetWarehouseByIdAsync(int? id);
        Task<PagingList<Warehouse>> GetAllWarehousesAsync(string filter, int pageindex = 1, string sort = "Name");
        Task<bool> ImportWarehouseAsync(string fileName, string destiny);
    }
}
