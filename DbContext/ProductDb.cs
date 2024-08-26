
using Microsoft.EntityFrameworkCore;
using MinimalDemoApi.Models;
// Create the ProductDbContext class
public class ProductDbContext : DbContext
{
    public ProductDbContext(DbContextOptions<ProductDbContext> options)
        : base(options)
    {
    }

    public DbSet<Product> Products { get; set; }
}