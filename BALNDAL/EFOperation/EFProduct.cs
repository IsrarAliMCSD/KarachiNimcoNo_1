using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFProduct
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFProduct()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }
        public List<Product> getAllProducts()
        {
            return KarachiNPcontext.Products.Include("Category").Where(a => a.IsActive == true && a.Category.IsActive==true).ToList();
        }
        public List<Product> getAllDashBoardProducts()
        {
            return KarachiNPcontext.Products.Include("Category").Where(a => a.IsActive == true && a.ShowOnDesktop==true && a.Category.IsActive == true).ToList();
        }
        
        public Product getByIdProduct(int id)
        {
            return KarachiNPcontext.Products.Where(a => a.ProductId == id && a.IsActive == true).FirstOrDefault();
        }
        public bool saveProduct(ref Product product, ref string returnMessage, int userId)
        {

            result = false;
            using (KarachiNPcontext)
            {
                if (product != null && product.ProductId > 0)//Edit
                {
                    int ProductId = product.ProductId;
                    Product objproduct = KarachiNPcontext.Products.Where(a => a.ProductId == ProductId).FirstOrDefault();
                    objproduct.ProductName = product.ProductName;
                    objproduct.ProductDescription = product.ProductDescription;
                    objproduct.CategoryId = product.CategoryId;
                    objproduct.IsNewProduct = product.IsNewProduct;
                    objproduct.ShowOnDesktop = product.ShowOnDesktop;
                    if (product.ImageURL != null && product.ImageURL != "")
                    {
                        objproduct.ImageURL = product.ImageURL;
                    }
                    objproduct.ModifiedBy = userId;
                    objproduct.ModifiedDate = DateTime.Now;
                    objproduct.IsActive = product.IsActive;
                    result = true;
                }
                else
                {
                    product.CreatedBy = userId;
                    product.CreatedDate = DateTime.Now;
                    KarachiNPcontext.Products.Add(product);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                int id = product.ProductId;
                product = KarachiNPcontext.Products.Where(a => a.ProductId == id).FirstOrDefault();
                return result;
            }
        }

        public bool deleteProduct(int productId, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                Product objproduct = KarachiNPcontext.Products.Where(a => a.ProductId == productId).FirstOrDefault();
                if (objproduct != null)
                {
                    objproduct.IsActive = false;
                    objproduct.ModifiedBy = userId;
                    objproduct.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }

    }
}
