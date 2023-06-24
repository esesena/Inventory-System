﻿using Inventory.Models.Enums;
using System.ComponentModel.DataAnnotations;

namespace Inventory.Models
{
    public class Item
    {
        [Key]
        [Display(Name = "Código")]
        [StringLength(150, ErrorMessage = "Máximo de {1} caracteres!")]
        public string Id { get; set; }

        [Display(Name = "Nome")]
        [StringLength(150, ErrorMessage = "Máximo de {1} caracteres!")]
        [Required(ErrorMessage = "{0} é obrigatório")]
        public string Name { get; set; }

        [Display(Name = "Unidade de Medida")]
        [Required(ErrorMessage = "{0} é obrigatório")]
        public UnitOfMeasurement UnitOfMeasurement { get; set; }

        [Display(Name = "Prateleira")]
        [Required(ErrorMessage = "{0} é obrigatório")]
        public IEnumerable<ItemsAddressings> Addressings { get; set; }

        [Display(Name = "Observação")]
        [StringLength(250, ErrorMessage = "Máximo de {1} caracteres!")]
        public string Observation { get; set; }

        [Display(Name = "Imagem do Item")]
        public string ImageUrl { get; set; }
        public IEnumerable<ItemsStockTaking> StockTaking { get; set; }

    }
}
