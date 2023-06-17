﻿// <auto-generated />
using System;
using Inventory.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Inventory.Migrations
{
    [DbContext(typeof(InventoryContext))]
    partial class InventoryContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.16")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("Inventory.Models.Addressing", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<int>("WarehouseId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("WarehouseId");

                    b.ToTable("Addressing");
                });

            modelBuilder.Entity("Inventory.Models.AddressingsStockTaking", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<bool>("AddressingCountEnded")
                        .HasColumnType("tinyint(1)");

                    b.Property<bool>("AddressingCountRealized")
                        .HasColumnType("tinyint(1)");

                    b.Property<int>("AddressingId")
                        .HasColumnType("int");

                    b.Property<int>("InventoryStartId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("AddressingId");

                    b.HasIndex("InventoryStartId");

                    b.ToTable("AddressingsStockTaking");
                });

            modelBuilder.Entity("Inventory.Models.InventoryMovement", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<double>("Amount")
                        .HasColumnType("double");

                    b.Property<DateTime>("ImportDate")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("ItemId")
                        .HasColumnType("varchar(255)");

                    b.Property<DateTime>("MovementDate")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("MovementeType")
                        .HasColumnType("int");

                    b.Property<int>("WarehouseId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ItemId");

                    b.HasIndex("WarehouseId");

                    b.ToTable("InventoryMovement");
                });

            modelBuilder.Entity("Inventory.Models.InventoryStart", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<DateTime>("InventoryStartDate")
                        .HasColumnType("datetime(6)");

                    b.Property<bool>("IsCompleted")
                        .HasColumnType("tinyint(1)");

                    b.Property<DateTime>("StockTakingFinishDate")
                        .HasColumnType("datetime(6)");

                    b.HasKey("Id");

                    b.ToTable("InventoryStart");
                });

            modelBuilder.Entity("Inventory.Models.Item", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("ImageUrl")
                        .HasColumnType("longtext");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.Property<string>("Observation")
                        .HasMaxLength(250)
                        .HasColumnType("varchar(250)");

                    b.Property<decimal>("Quantity")
                        .HasColumnType("decimal(65,30)");

                    b.Property<int>("UnitOfMeasurement")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("Item");
                });

            modelBuilder.Entity("Inventory.Models.ItemsAddressings", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("AddressingId")
                        .HasColumnType("int");

                    b.Property<string>("ItemId")
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.HasIndex("AddressingId");

                    b.HasIndex("ItemId");

                    b.ToTable("ItemsAddressing");
                });

            modelBuilder.Entity("Inventory.Models.ItemsStockTaking", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("InventoryStartId")
                        .HasColumnType("int");

                    b.Property<bool>("ItemCountEnded")
                        .HasColumnType("tinyint(1)");

                    b.Property<bool>("ItemCountRealized")
                        .HasColumnType("tinyint(1)");

                    b.Property<string>("ItemId")
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.HasIndex("InventoryStartId");

                    b.HasIndex("ItemId");

                    b.ToTable("ItemsStockTaking");
                });

            modelBuilder.Entity("Inventory.Models.StockTaking", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<int>("AddressingId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("ExpirationDate")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime?>("FabricationDate")
                        .HasColumnType("datetime(6)");

                    b.Property<int>("InventoryStartId")
                        .HasColumnType("int");

                    b.Property<string>("ItemBatch")
                        .HasMaxLength(30)
                        .HasColumnType("varchar(30)");

                    b.Property<string>("ItemId")
                        .IsRequired()
                        .HasColumnType("varchar(255)");

                    b.Property<int>("NumberOfCount")
                        .HasColumnType("int");

                    b.Property<DateTime?>("StockTakingDate")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("StockTakingObservation")
                        .HasMaxLength(250)
                        .HasColumnType("varchar(250)");

                    b.Property<decimal>("StockTakingQuantity")
                        .HasColumnType("decimal(65,30)");

                    b.HasKey("Id");

                    b.HasIndex("AddressingId");

                    b.HasIndex("InventoryStartId");

                    b.HasIndex("ItemId");

                    b.ToTable("StockTaking");
                });

            modelBuilder.Entity("Inventory.Models.Warehouse", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar(50)");

                    b.HasKey("Id");

                    b.ToTable("Warehouse");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("longtext");

                    b.Property<string>("Name")
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasDatabaseName("RoleNameIndex");

                    b.ToTable("AspNetRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("ClaimType")
                        .HasColumnType("longtext");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("longtext");

                    b.Property<string>("RoleId")
                        .IsRequired()
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUser", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("varchar(255)");

                    b.Property<int>("AccessFailedCount")
                        .HasColumnType("int");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("longtext");

                    b.Property<string>("Email")
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.Property<bool>("EmailConfirmed")
                        .HasColumnType("tinyint(1)");

                    b.Property<bool>("LockoutEnabled")
                        .HasColumnType("tinyint(1)");

                    b.Property<DateTimeOffset?>("LockoutEnd")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.Property<string>("PasswordHash")
                        .HasColumnType("longtext");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("longtext");

                    b.Property<bool>("PhoneNumberConfirmed")
                        .HasColumnType("tinyint(1)");

                    b.Property<string>("SecurityStamp")
                        .HasColumnType("longtext");

                    b.Property<bool>("TwoFactorEnabled")
                        .HasColumnType("tinyint(1)");

                    b.Property<string>("UserName")
                        .HasMaxLength(256)
                        .HasColumnType("varchar(256)");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedEmail")
                        .HasDatabaseName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasDatabaseName("UserNameIndex");

                    b.ToTable("AspNetUsers", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("ClaimType")
                        .HasColumnType("longtext");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("longtext");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("varchar(128)");

                    b.Property<string>("ProviderKey")
                        .HasMaxLength(128)
                        .HasColumnType("varchar(128)");

                    b.Property<string>("ProviderDisplayName")
                        .HasColumnType("longtext");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("varchar(255)");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("RoleId")
                        .HasColumnType("varchar(255)");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("varchar(128)");

                    b.Property<string>("Name")
                        .HasMaxLength(128)
                        .HasColumnType("varchar(128)");

                    b.Property<string>("Value")
                        .HasColumnType("longtext");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens", (string)null);
                });

            modelBuilder.Entity("Inventory.Models.Addressing", b =>
                {
                    b.HasOne("Inventory.Models.Warehouse", "Warehouse")
                        .WithMany("Addressings")
                        .HasForeignKey("WarehouseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Warehouse");
                });

            modelBuilder.Entity("Inventory.Models.AddressingsStockTaking", b =>
                {
                    b.HasOne("Inventory.Models.Addressing", "Addressing")
                        .WithMany("StockTaking")
                        .HasForeignKey("AddressingId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Inventory.Models.InventoryStart", "InventoryStart")
                        .WithMany("Addressings")
                        .HasForeignKey("InventoryStartId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Addressing");

                    b.Navigation("InventoryStart");
                });

            modelBuilder.Entity("Inventory.Models.InventoryMovement", b =>
                {
                    b.HasOne("Inventory.Models.Item", "Item")
                        .WithMany()
                        .HasForeignKey("ItemId");

                    b.HasOne("Inventory.Models.Warehouse", "Warehouse")
                        .WithMany()
                        .HasForeignKey("WarehouseId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Item");

                    b.Navigation("Warehouse");
                });

            modelBuilder.Entity("Inventory.Models.ItemsAddressings", b =>
                {
                    b.HasOne("Inventory.Models.Addressing", "Addressing")
                        .WithMany("Item")
                        .HasForeignKey("AddressingId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Inventory.Models.Item", "Item")
                        .WithMany("Addressings")
                        .HasForeignKey("ItemId");

                    b.Navigation("Addressing");

                    b.Navigation("Item");
                });

            modelBuilder.Entity("Inventory.Models.ItemsStockTaking", b =>
                {
                    b.HasOne("Inventory.Models.InventoryStart", "InventoryStart")
                        .WithMany("Items")
                        .HasForeignKey("InventoryStartId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Inventory.Models.Item", "Item")
                        .WithMany("StockTaking")
                        .HasForeignKey("ItemId");

                    b.Navigation("InventoryStart");

                    b.Navigation("Item");
                });

            modelBuilder.Entity("Inventory.Models.StockTaking", b =>
                {
                    b.HasOne("Inventory.Models.Addressing", "Addressing")
                        .WithMany()
                        .HasForeignKey("AddressingId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Inventory.Models.InventoryStart", "InventoryStart")
                        .WithMany()
                        .HasForeignKey("InventoryStartId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Inventory.Models.Item", "Item")
                        .WithMany()
                        .HasForeignKey("ItemId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Addressing");

                    b.Navigation("InventoryStart");

                    b.Navigation("Item");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Inventory.Models.Addressing", b =>
                {
                    b.Navigation("Item");

                    b.Navigation("StockTaking");
                });

            modelBuilder.Entity("Inventory.Models.InventoryStart", b =>
                {
                    b.Navigation("Addressings");

                    b.Navigation("Items");
                });

            modelBuilder.Entity("Inventory.Models.Item", b =>
                {
                    b.Navigation("Addressings");

                    b.Navigation("StockTaking");
                });

            modelBuilder.Entity("Inventory.Models.Warehouse", b =>
                {
                    b.Navigation("Addressings");
                });
#pragma warning restore 612, 618
        }
    }
}
