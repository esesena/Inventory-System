﻿using Inventory.Helpers.Interfaces;
using Inventory.Models;
using Inventory.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Inventory.Controllers
{
    [Route("Movimentacao")]
    [Authorize(Roles = "Admin")]
    public class InventoryMovementController : Controller
    {
        private readonly IInventoryMovementService _inventoryMovementService;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly IUtil _util;
        private readonly string _destiny = "InventoryMovement";

        public InventoryMovementController(IInventoryMovementService inventoryMovementService, IUtil util, IWebHostEnvironment hostEnvironment)
        {
            _inventoryMovementService = inventoryMovementService;
            _util = util;
            _hostEnvironment = hostEnvironment;
        }

        public IActionResult Index(List<InventoryMovement> inventoryMovment = null)
        {
            inventoryMovment = inventoryMovment == null ? new List<InventoryMovement>() : inventoryMovment;
            return View(inventoryMovment);
        }

        [HttpPost]
        [Route("Importacao")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UploadDocument(IFormFile documentFile)
        {
            if (documentFile != null && documentFile.Length > 0)
            {
                try
                {
                    // Salva o documento
                    string documentName = await _util.SaveDocument(documentFile, _destiny);

                    // Lê o arquivo CSV e cria os modelos
                    string documentPath = Path.Combine(_hostEnvironment.ContentRootPath, "Resources", _destiny, documentName);
                    // Implemente o código para ler o arquivo CSV e criar os modelos
                    List<InventoryMovement> inventoryMovements = await _inventoryMovementService.ImportInventoryMovementsAsync(documentPath, _destiny);

                    // Deleta o arquivo
                    _util.DeleteDocument(documentName, _destiny);

                    // Retorna uma resposta de sucesso ou redireciona para outra página
                    TempData["successMessage"] = "Itens";
                    return RedirectToAction("Index", "Warehouses");


                }
                catch (Exception ex)
                {

                    // Retorna uma resposta de erro ou redireciona para outra página
                    TempData["errorMessage"] = "item";
                    return RedirectToAction("ImportAll", "Imports");
                }
            }

            // Retorna uma resposta de erro ou redireciona para outra página
            TempData["errorMessage"] = "item";
            return RedirectToAction("ImportAll", "Imports");
        }
    }
}
