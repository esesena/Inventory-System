﻿using Inventory.Models;
using Inventory.Models.Enums;
using Inventory.ViewModels.ViewModelEnums;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Inventory.ViewModels
{
    public class FinalReportViewModel
    {
        [Display(Name = "Código do Item")]
        public string ItemId { get; set; }

        [Display(Name = "Nome do Item")]
        public string ItemName { get; set; }

        [Display(Name = "Unidade de Medida")]
        public UnitOfMeasurement UnitOfMeasurement { get; set; }

        [Display(Name = "Estoque do Sistema")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal SystemQuantity { get; set; }

        [Display(Name = "Quantidade Contada")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal QuantityStockTaking { get; set; }

        [Display(Name = "Divergência")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal Divergence { get; set; }

        [Display(Name = "Situação do Estoque")]
        public StockSituation StockSituation { get; set; }

        [Display(Name = "Situação do Armazenamento")]
        public AddressingSituation AddressingSituation { get; set; }

        public IEnumerable<StockTaking> StockTakings { get; set; }
        public IEnumerable<ItemsAddressings> Addressings { get; set; }
        public IEnumerable<InventoryMovement> InventoryMovement { get; set; }
    }
}
