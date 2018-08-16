using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFCategory
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFCategory()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }
        public List<Category > getAllCategories()
        {
            return KarachiNPcontext.Categories.Where(a => a.IsActive == true).ToList();
        }
        public Category getByIdCategory(int id)
        {
            return KarachiNPcontext.Categories.Where(a => a.CategoryId == id && a.IsActive == true).FirstOrDefault();
        }
        public bool saveCategory(ref Category category, ref string returnMessage, int userId)
        {

            result = false;
            using (KarachiNPcontext)
            {
                if (category != null && category.CategoryId > 0)//Edit
                {
                    int categoryId = category.CategoryId;
                    Category objCategory = KarachiNPcontext.Categories.Where(a => a.CategoryId == categoryId).FirstOrDefault();
                    objCategory.CategoryDescription = category.CategoryDescription;
                    objCategory.CategoryName = category.CategoryName;
                    objCategory.IsNewCategory = category.IsNewCategory;
                    if (category.ImageURL != null && category.ImageURL != "")
                    {
                        objCategory.ImageURL = category.ImageURL;
                    }
                    objCategory.ModifiedBy = userId;
                    objCategory.ModifiedDate = DateTime.Now;
                    objCategory.IsActive = category.IsActive;
                    result = true;
                }
                else
                {
                    category.CreatedBy = userId;
                    category.CreatedDate = DateTime.Now;
                    KarachiNPcontext.Categories.Add(category);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                int id = category.CategoryId;
                category = KarachiNPcontext.Categories.Where(a => a.CategoryId == id).FirstOrDefault();
                return result;
            }
        }

        public bool deleteCategory(int categoryId, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                Category objCategory = KarachiNPcontext.Categories.Where(a => a.CategoryId == categoryId).FirstOrDefault();
                if (objCategory != null)
                {
                    objCategory.IsActive = false;
                    objCategory.ModifiedBy = userId;
                    objCategory.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }
    }
}
