using System;
using System.Collections.Generic;
using System.Linq;
using  AngularJsDemo.Models.CustomModel;

namespace AngularJsDemo.Models.CustomRepository
{
    public class EmployeeRepository:IDisposable
    {
        #region GetDesignation

        public List<tblDesignation> DegList()
        {
            using (var db = new TestDemoEntities())
            {
                return db.tblDesignations.ToList();
            }
        }

        #endregion

        #region GetHobby

        public List<HobbyList> HbList(string[] id = null)
        {
            var list = new List<HobbyList>();
            using (var db = new TestDemoEntities())
            {
                var data = db.tblHobbies.ToList();
                foreach (var item in data)
                {
                    HobbyList obj = new HobbyList
                    {
                        Id = item.HobbyId,
                        HName = item.HName
                    };
                    if (id != null && id.Contains(obj.Id.ToString()))
                    {
                        obj.Selelcted = true;
                    }
                    else
                    {
                        obj.Selelcted = false;
                    }
                    list.Add(obj);
                }
            }
            return list;
        }

        #endregion

        #region GetHobbyString

        public static string GetHobbyString(string id)
        {
            string ret = string.Empty;

            using (var db = new TestDemoEntities())
            {
                if (id != null)
                {
                    string[] hobbyId = id.Split(',');
                    foreach (var item in hobbyId)
                    {
                        long hid = Convert.ToInt64(item);
                        var data = db.tblHobbies.Where(e => e.HobbyId == hid).Select(x => x.HName).First();
                        if (string.IsNullOrEmpty(ret))
                        {
                            ret = data;
                        }
                        else
                        {
                            ret = ret + "," + data;
                        }

                    }

                }
            }
            return ret;
        }

        #endregion

        #region GetList
        public EmployeeModel GetList()
        {
            try
            {
                EmployeeModel pageDetails = new EmployeeModel();
                using (var db = new TestDemoEntities())
                {
                    pageDetails.EmpList = (from e in db.tblEmployees
                                           join d in db.tblDesignations on e.EmpDesignation equals d.DesignationId into ems
                                           from j in ems.DefaultIfEmpty()
                                           where e.IsDelete == false
                                           select new EmployeeModel()
                                           {
                                               EmpId = e.EmpId,
                                               EmpAddress = e.EmpAddress,
                                               EmpName = e.EmpName,
                                               EmpGender = e.EmpGender,
                                               DesName = j.DesName,
                                               EmpHobby = e.EmpHobby,
                                               EmpEmail = e.EmpEmail,
                                               EmpImage = e.EmpImage,
                                               Birthdate = e.Birthdate,
                                               EmpDesignation = e.EmpDesignation,
                                               //DOB = e.Birthdate.Value.ToString("mm/dd/yy")
                                           })
                                           .AsEnumerable()
                                           .Select(x => new EmployeeModel
                                           {
                                               EmpId = x.EmpId,
                                               EmpAddress = x.EmpAddress,
                                               EmpName = x.EmpName,
                                               EmpGender = x.EmpGender,
                                               DesName = x.DesName,
                                               HName = GetHobbyString(x.EmpHobby),
                                               EmpEmail = x.EmpEmail,
                                               EmpImage = x.EmpImage,
                                               Birthdate = x.Birthdate.Value,
                                               //DOB = x.DOB,
                                               EmpDesignation = x.EmpDesignation,
                                               HbList = x.EmpHobby!= null? HbList(x.EmpHobby.Split(',')):HbList()
                                           }).ToList();
                }
                return pageDetails;
            }
            catch (Exception  ex)
            {
                string log = ex.ToString();
                return new EmployeeModel();
            }
        }
        #endregion

        #region GetById
        public EmployeeModel GetById(long id)
        {
            using (var db = new TestDemoEntities())
            {
                EmployeeModel details = new EmployeeModel();
                var data = db.tblEmployees.FirstOrDefault(m => m.EmpId == id);
                if (data != null)
                {
                    details.EmpId = data.EmpId;
                    details.EmpName = data.EmpName;
                    details.EmpEmail = data.EmpEmail;
                    details.IsActive = Convert.ToBoolean(data.IsActive);
                    details.EmpAddress = data.EmpAddress;
                    details.EmpDesignation = data.EmpDesignation;
                    details.EmpGender = data.EmpGender;
                    details.EmpHobby = data.EmpHobby;
                    details.EmpImage = data.EmpImage;
                    details.Birthdate = data.Birthdate;
                }
                return details;
            }
        }

        #endregion

        #region Add Data
        public bool AddData(EmployeeModel model)
        {
            try
            {
                using (var db = new TestDemoEntities())
                {
                    var pageData = new tblEmployee();
                    {
                        pageData.EmpName = model.EmpName;
                        pageData.EmpEmail = model.EmpEmail;
                        pageData.EmpAddress = model.EmpAddress;
                        pageData.CreatedDate = DateTime.Now;
                        pageData.ModifiedDate = DateTime.Now;
                        pageData.IsActive = true;
                        pageData.IsDelete = false;
                        pageData.EmpDesignation = model.EmpDesignation;
                        pageData.EmpHobby = model.EmpHobby;
                        pageData.EmpGender = model.EmpGender;
                        pageData.EmpImage = model.EmpImage;
                        pageData.Birthdate = model.Birthdate;
                        db.tblEmployees.Add(pageData);
                        db.SaveChanges();
                    }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Edit Data
        public bool EditData(EmployeeModel emp)
        {
            try
            {
                using (var db = new TestDemoEntities())
                {
                    var data = (from sm in db.tblEmployees
                                where sm.EmpId == emp.EmpId
                                select sm).FirstOrDefault();
                    if (data != null)
                    {
                        data.EmpName = emp.EmpName;
                        data.EmpEmail = emp.EmpEmail;
                        data.EmpGender = emp.EmpGender;
                        data.EmpHobby = emp.EmpHobby;
                        data.EmpDesignation = emp.EmpDesignation;
                        data.EmpAddress = emp.EmpAddress;
                        data.IsActive = emp.IsActive;
                        data.EmpImage = emp.EmpImage;
                        data.Birthdate = emp.Birthdate;
                        db.SaveChanges();
                        return true;
                    }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Delete Record
        public bool DeleteRecord(long id)
        {
            try
            {
                using (var db = new TestDemoEntities())
                {
                    var data = db.tblEmployees.Find(id);
                    if (data != null)
                    {
                        data.IsDelete = true;
                        data.IsActive = false;
                        data.DeletedDate = DateTime.Now;
                        db.Entry(data).CurrentValues.SetValues(data);
                        db.SaveChanges();
                    }
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region Disposible

        private bool _disposed;

        private void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    using (var db = new TestDemoEntities())
                    {
                        db.Dispose();
                    }
                }
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }


        #endregion
    }
}