﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBProject
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class cmmsystemEntities1 : DbContext
    {
        public cmmsystemEntities1()
            : base("name=cmmsystemEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Appointment> Appointments { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<LoginTable> LoginTables { get; set; }
        public virtual DbSet<OtherStaff> OtherStaffs { get; set; }
        public virtual DbSet<deptInfo> deptInfoes { get; set; }
        public virtual DbSet<STAFF_VIEW> STAFF_VIEW { get; set; }
        public virtual DbSet<Appointment_view> Appointment_view { get; set; }
        public virtual DbSet<Department_View> Department_View { get; set; }
        public virtual DbSet<PATIENT_VIEW> PATIENT_VIEW { get; set; }
        public virtual DbSet<Inventario> Inventarios { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<DatosConsulta> DatosConsultas { get; set; }
    
        public virtual int AddDoctor(string name, string email, string password, Nullable<System.DateTime> birthDate, Nullable<int> dept, string gender, string address, Nullable<int> exp, Nullable<int> salary, string spec, string phone, Nullable<int> charges, string qual)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            var birthDateParameter = birthDate.HasValue ?
                new ObjectParameter("BirthDate", birthDate) :
                new ObjectParameter("BirthDate", typeof(System.DateTime));
    
            var deptParameter = dept.HasValue ?
                new ObjectParameter("dept", dept) :
                new ObjectParameter("dept", typeof(int));
    
            var genderParameter = gender != null ?
                new ObjectParameter("gender", gender) :
                new ObjectParameter("gender", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var expParameter = exp.HasValue ?
                new ObjectParameter("Exp", exp) :
                new ObjectParameter("Exp", typeof(int));
    
            var salaryParameter = salary.HasValue ?
                new ObjectParameter("Salary", salary) :
                new ObjectParameter("Salary", typeof(int));
    
            var specParameter = spec != null ?
                new ObjectParameter("spec", spec) :
                new ObjectParameter("spec", typeof(string));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("phone", phone) :
                new ObjectParameter("phone", typeof(string));
    
            var chargesParameter = charges.HasValue ?
                new ObjectParameter("charges", charges) :
                new ObjectParameter("charges", typeof(int));
    
            var qualParameter = qual != null ?
                new ObjectParameter("qual", qual) :
                new ObjectParameter("qual", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AddDoctor", nameParameter, emailParameter, passwordParameter, birthDateParameter, deptParameter, genderParameter, addressParameter, expParameter, salaryParameter, specParameter, phoneParameter, chargesParameter, qualParameter);
        }
    
        public virtual int APPROVE_APPOINTMENT(Nullable<int> aPPOINT_ID)
        {
            var aPPOINT_IDParameter = aPPOINT_ID.HasValue ?
                new ObjectParameter("APPOINT_ID", aPPOINT_ID) :
                new ObjectParameter("APPOINT_ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("APPROVE_APPOINTMENT", aPPOINT_IDParameter);
        }
    
        public virtual int CheckDoctorEmail(string email, ObjectParameter status)
        {
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("CheckDoctorEmail", emailParameter, status);
        }
    
        public virtual int delete_APPOINTMENT(Nullable<int> aPPOINT_ID)
        {
            var aPPOINT_IDParameter = aPPOINT_ID.HasValue ?
                new ObjectParameter("APPOINT_ID", aPPOINT_ID) :
                new ObjectParameter("APPOINT_ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("delete_APPOINTMENT", aPPOINT_IDParameter);
        }
    
        public virtual int DeleteDoctor(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DeleteDoctor", idParameter);
        }
    
        public virtual int DELETESTAFF(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DELETESTAFF", idParameter);
        }
    
        public virtual ObjectResult<Doctor_Information_By_ID1_Result> Doctor_Information_By_ID1(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Doctor_Information_By_ID1_Result>("Doctor_Information_By_ID1", idParameter);
        }
    
        public virtual int finishedPaid(Nullable<int> docId, Nullable<int> appointid)
        {
            var docIdParameter = docId.HasValue ?
                new ObjectParameter("docId", docId) :
                new ObjectParameter("docId", typeof(int));
    
            var appointidParameter = appointid.HasValue ?
                new ObjectParameter("appointid", appointid) :
                new ObjectParameter("appointid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("finishedPaid", docIdParameter, appointidParameter);
        }
    
        public virtual int finishedUnpaid(Nullable<int> docId, Nullable<int> appointid)
        {
            var docIdParameter = docId.HasValue ?
                new ObjectParameter("docId", docId) :
                new ObjectParameter("docId", typeof(int));
    
            var appointidParameter = appointid.HasValue ?
                new ObjectParameter("appointid", appointid) :
                new ObjectParameter("appointid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("finishedUnpaid", docIdParameter, appointidParameter);
        }
    
        public virtual ObjectResult<Nullable<double>> generate_bill(Nullable<int> did)
        {
            var didParameter = did.HasValue ?
                new ObjectParameter("did", did) :
                new ObjectParameter("did", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<double>>("generate_bill", didParameter);
        }
    
        public virtual ObjectResult<get_appointment_Result> get_appointment(Nullable<int> aPPOINT_ID)
        {
            var aPPOINT_IDParameter = aPPOINT_ID.HasValue ?
                new ObjectParameter("APPOINT_ID", aPPOINT_ID) :
                new ObjectParameter("APPOINT_ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<get_appointment_Result>("get_appointment", aPPOINT_IDParameter);
        }
    
        public virtual ObjectResult<GET_DOCTOR_PROFILE_Result> GET_DOCTOR_PROFILE(Nullable<int> dID, ObjectParameter name, ObjectParameter phone, ObjectParameter gender, ObjectParameter charges, ObjectParameter rI, ObjectParameter pTreated, ObjectParameter qualification, ObjectParameter specialization, ObjectParameter workE, ObjectParameter age)
        {
            var dIDParameter = dID.HasValue ?
                new ObjectParameter("dID", dID) :
                new ObjectParameter("dID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GET_DOCTOR_PROFILE_Result>("GET_DOCTOR_PROFILE", dIDParameter, name, phone, gender, charges, rI, pTreated, qualification, specialization, workE, age);
        }
    
        public virtual int GET_STAFF(Nullable<int> id, ObjectParameter name, ObjectParameter phone, ObjectParameter gender, ObjectParameter address, ObjectParameter desig, ObjectParameter sal)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GET_STAFF", idParameter, name, phone, gender, address, desig, sal);
        }
    
        public virtual int Login(string email, string password, ObjectParameter status, ObjectParameter iD, ObjectParameter type)
        {
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Login", emailParameter, passwordParameter, status, iD, type);
        }
    
        public virtual int PatientDelete(Nullable<int> patientID)
        {
            var patientIDParameter = patientID.HasValue ?
                new ObjectParameter("PatientID", patientID) :
                new ObjectParameter("PatientID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("PatientDelete", patientIDParameter);
        }
    
        public virtual int PatientInsert(Nullable<int> patientID, string name, string phone, string address, Nullable<System.DateTime> birthDate, string gender, string nombres, string apellidos, string sexo, string email, string teléfono_móvil, string sin_celular, string teléfono, string cURP, string dirección, string país, string estado, string ciudad, string cP, string número_exterior, string número_interior)
        {
            var patientIDParameter = patientID.HasValue ?
                new ObjectParameter("PatientID", patientID) :
                new ObjectParameter("PatientID", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("Phone", phone) :
                new ObjectParameter("Phone", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var birthDateParameter = birthDate.HasValue ?
                new ObjectParameter("BirthDate", birthDate) :
                new ObjectParameter("BirthDate", typeof(System.DateTime));
    
            var genderParameter = gender != null ?
                new ObjectParameter("Gender", gender) :
                new ObjectParameter("Gender", typeof(string));
    
            var nombresParameter = nombres != null ?
                new ObjectParameter("Nombres", nombres) :
                new ObjectParameter("Nombres", typeof(string));
    
            var apellidosParameter = apellidos != null ?
                new ObjectParameter("Apellidos", apellidos) :
                new ObjectParameter("Apellidos", typeof(string));
    
            var sexoParameter = sexo != null ?
                new ObjectParameter("Sexo", sexo) :
                new ObjectParameter("Sexo", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var teléfono_móvilParameter = teléfono_móvil != null ?
                new ObjectParameter("Teléfono_móvil", teléfono_móvil) :
                new ObjectParameter("Teléfono_móvil", typeof(string));
    
            var sin_celularParameter = sin_celular != null ?
                new ObjectParameter("Sin_celular", sin_celular) :
                new ObjectParameter("Sin_celular", typeof(string));
    
            var teléfonoParameter = teléfono != null ?
                new ObjectParameter("Teléfono", teléfono) :
                new ObjectParameter("Teléfono", typeof(string));
    
            var cURPParameter = cURP != null ?
                new ObjectParameter("CURP", cURP) :
                new ObjectParameter("CURP", typeof(string));
    
            var direcciónParameter = dirección != null ?
                new ObjectParameter("Dirección", dirección) :
                new ObjectParameter("Dirección", typeof(string));
    
            var paísParameter = país != null ?
                new ObjectParameter("País", país) :
                new ObjectParameter("País", typeof(string));
    
            var estadoParameter = estado != null ?
                new ObjectParameter("Estado", estado) :
                new ObjectParameter("Estado", typeof(string));
    
            var ciudadParameter = ciudad != null ?
                new ObjectParameter("Ciudad", ciudad) :
                new ObjectParameter("Ciudad", typeof(string));
    
            var cPParameter = cP != null ?
                new ObjectParameter("CP", cP) :
                new ObjectParameter("CP", typeof(string));
    
            var número_exteriorParameter = número_exterior != null ?
                new ObjectParameter("Número_exterior", número_exterior) :
                new ObjectParameter("Número_exterior", typeof(string));
    
            var número_interiorParameter = número_interior != null ?
                new ObjectParameter("Número_interior", número_interior) :
                new ObjectParameter("Número_interior", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("PatientInsert", patientIDParameter, nameParameter, phoneParameter, addressParameter, birthDateParameter, genderParameter, nombresParameter, apellidosParameter, sexoParameter, emailParameter, teléfono_móvilParameter, sin_celularParameter, teléfonoParameter, cURPParameter, direcciónParameter, paísParameter, estadoParameter, ciudadParameter, cPParameter, número_exteriorParameter, número_interiorParameter);
        }
    
        public virtual int PatientUpdate(Nullable<int> patientID, string name, string phone, string address, Nullable<System.DateTime> birthDate, string gender, string nombres, string apellidos, string sexo, string email, string teléfono_móvil, string sin_celular, string teléfono, string cURP, string dirección, string país, string estado, string ciudad, string cP, string número_exterior, string número_interior)
        {
            var patientIDParameter = patientID.HasValue ?
                new ObjectParameter("PatientID", patientID) :
                new ObjectParameter("PatientID", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("Phone", phone) :
                new ObjectParameter("Phone", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var birthDateParameter = birthDate.HasValue ?
                new ObjectParameter("BirthDate", birthDate) :
                new ObjectParameter("BirthDate", typeof(System.DateTime));
    
            var genderParameter = gender != null ?
                new ObjectParameter("Gender", gender) :
                new ObjectParameter("Gender", typeof(string));
    
            var nombresParameter = nombres != null ?
                new ObjectParameter("Nombres", nombres) :
                new ObjectParameter("Nombres", typeof(string));
    
            var apellidosParameter = apellidos != null ?
                new ObjectParameter("Apellidos", apellidos) :
                new ObjectParameter("Apellidos", typeof(string));
    
            var sexoParameter = sexo != null ?
                new ObjectParameter("Sexo", sexo) :
                new ObjectParameter("Sexo", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var teléfono_móvilParameter = teléfono_móvil != null ?
                new ObjectParameter("Teléfono_móvil", teléfono_móvil) :
                new ObjectParameter("Teléfono_móvil", typeof(string));
    
            var sin_celularParameter = sin_celular != null ?
                new ObjectParameter("Sin_celular", sin_celular) :
                new ObjectParameter("Sin_celular", typeof(string));
    
            var teléfonoParameter = teléfono != null ?
                new ObjectParameter("Teléfono", teléfono) :
                new ObjectParameter("Teléfono", typeof(string));
    
            var cURPParameter = cURP != null ?
                new ObjectParameter("CURP", cURP) :
                new ObjectParameter("CURP", typeof(string));
    
            var direcciónParameter = dirección != null ?
                new ObjectParameter("Dirección", dirección) :
                new ObjectParameter("Dirección", typeof(string));
    
            var paísParameter = país != null ?
                new ObjectParameter("País", país) :
                new ObjectParameter("País", typeof(string));
    
            var estadoParameter = estado != null ?
                new ObjectParameter("Estado", estado) :
                new ObjectParameter("Estado", typeof(string));
    
            var ciudadParameter = ciudad != null ?
                new ObjectParameter("Ciudad", ciudad) :
                new ObjectParameter("Ciudad", typeof(string));
    
            var cPParameter = cP != null ?
                new ObjectParameter("CP", cP) :
                new ObjectParameter("CP", typeof(string));
    
            var número_exteriorParameter = número_exterior != null ?
                new ObjectParameter("Número_exterior", número_exterior) :
                new ObjectParameter("Número_exterior", typeof(string));
    
            var número_interiorParameter = número_interior != null ?
                new ObjectParameter("Número_interior", número_interior) :
                new ObjectParameter("Número_interior", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("PatientUpdate", patientIDParameter, nameParameter, phoneParameter, addressParameter, birthDateParameter, genderParameter, nombresParameter, apellidosParameter, sexoParameter, emailParameter, teléfono_móvilParameter, sin_celularParameter, teléfonoParameter, cURPParameter, direcciónParameter, paísParameter, estadoParameter, ciudadParameter, cPParameter, número_exteriorParameter, número_interiorParameter);
        }
    
        public virtual ObjectResult<PENDING_APPOINTMENTS2_Result> PENDING_APPOINTMENTS2(Nullable<int> dOCTOR_ID)
        {
            var dOCTOR_IDParameter = dOCTOR_ID.HasValue ?
                new ObjectParameter("DOCTOR_ID", dOCTOR_ID) :
                new ObjectParameter("DOCTOR_ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<PENDING_APPOINTMENTS2_Result>("PENDING_APPOINTMENTS2", dOCTOR_IDParameter);
        }
    
        public virtual int proc_PatientDelete(Nullable<int> patientID)
        {
            var patientIDParameter = patientID.HasValue ?
                new ObjectParameter("PatientID", patientID) :
                new ObjectParameter("PatientID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("proc_PatientDelete", patientIDParameter);
        }
    
        public virtual int proc_PatientInsert(ObjectParameter patientID, string name, string phone, string address, Nullable<System.DateTime> birthDate, string gender, string nombres, string apellidos, string sexo, string email, string teléfono_móvil, string sin_celular, string teléfono, string cURP, string dirección, string país, string estado, string ciudad, string cP, string número_exterior, string número_interior)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("Phone", phone) :
                new ObjectParameter("Phone", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var birthDateParameter = birthDate.HasValue ?
                new ObjectParameter("BirthDate", birthDate) :
                new ObjectParameter("BirthDate", typeof(System.DateTime));
    
            var genderParameter = gender != null ?
                new ObjectParameter("Gender", gender) :
                new ObjectParameter("Gender", typeof(string));
    
            var nombresParameter = nombres != null ?
                new ObjectParameter("Nombres", nombres) :
                new ObjectParameter("Nombres", typeof(string));
    
            var apellidosParameter = apellidos != null ?
                new ObjectParameter("Apellidos", apellidos) :
                new ObjectParameter("Apellidos", typeof(string));
    
            var sexoParameter = sexo != null ?
                new ObjectParameter("Sexo", sexo) :
                new ObjectParameter("Sexo", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var teléfono_móvilParameter = teléfono_móvil != null ?
                new ObjectParameter("Teléfono_móvil", teléfono_móvil) :
                new ObjectParameter("Teléfono_móvil", typeof(string));
    
            var sin_celularParameter = sin_celular != null ?
                new ObjectParameter("Sin_celular", sin_celular) :
                new ObjectParameter("Sin_celular", typeof(string));
    
            var teléfonoParameter = teléfono != null ?
                new ObjectParameter("Teléfono", teléfono) :
                new ObjectParameter("Teléfono", typeof(string));
    
            var cURPParameter = cURP != null ?
                new ObjectParameter("CURP", cURP) :
                new ObjectParameter("CURP", typeof(string));
    
            var direcciónParameter = dirección != null ?
                new ObjectParameter("Dirección", dirección) :
                new ObjectParameter("Dirección", typeof(string));
    
            var paísParameter = país != null ?
                new ObjectParameter("País", país) :
                new ObjectParameter("País", typeof(string));
    
            var estadoParameter = estado != null ?
                new ObjectParameter("Estado", estado) :
                new ObjectParameter("Estado", typeof(string));
    
            var ciudadParameter = ciudad != null ?
                new ObjectParameter("Ciudad", ciudad) :
                new ObjectParameter("Ciudad", typeof(string));
    
            var cPParameter = cP != null ?
                new ObjectParameter("CP", cP) :
                new ObjectParameter("CP", typeof(string));
    
            var número_exteriorParameter = número_exterior != null ?
                new ObjectParameter("Número_exterior", número_exterior) :
                new ObjectParameter("Número_exterior", typeof(string));
    
            var número_interiorParameter = número_interior != null ?
                new ObjectParameter("Número_interior", número_interior) :
                new ObjectParameter("Número_interior", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("proc_PatientInsert", patientID, nameParameter, phoneParameter, addressParameter, birthDateParameter, genderParameter, nombresParameter, apellidosParameter, sexoParameter, emailParameter, teléfono_móvilParameter, sin_celularParameter, teléfonoParameter, cURPParameter, direcciónParameter, paísParameter, estadoParameter, ciudadParameter, cPParameter, número_exteriorParameter, número_interiorParameter);
        }
    
        public virtual ObjectResult<proc_PatientLoadAll_Result> proc_PatientLoadAll()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_PatientLoadAll_Result>("proc_PatientLoadAll");
        }
    
        public virtual ObjectResult<proc_PatientLoadByPrimaryKey_Result> proc_PatientLoadByPrimaryKey(Nullable<int> patientID)
        {
            var patientIDParameter = patientID.HasValue ?
                new ObjectParameter("PatientID", patientID) :
                new ObjectParameter("PatientID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_PatientLoadByPrimaryKey_Result>("proc_PatientLoadByPrimaryKey", patientIDParameter);
        }
    
        public virtual int proc_PatientUpdate(Nullable<int> patientID, string name, string phone, string address, Nullable<System.DateTime> birthDate, string gender, string nombres, string apellidos, string sexo, string email, string teléfono_móvil, string sin_celular, string teléfono, string cURP, string dirección, string país, string estado, string ciudad, string cP, string número_exterior, string número_interior)
        {
            var patientIDParameter = patientID.HasValue ?
                new ObjectParameter("PatientID", patientID) :
                new ObjectParameter("PatientID", typeof(int));
    
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("Phone", phone) :
                new ObjectParameter("Phone", typeof(string));
    
            var addressParameter = address != null ?
                new ObjectParameter("Address", address) :
                new ObjectParameter("Address", typeof(string));
    
            var birthDateParameter = birthDate.HasValue ?
                new ObjectParameter("BirthDate", birthDate) :
                new ObjectParameter("BirthDate", typeof(System.DateTime));
    
            var genderParameter = gender != null ?
                new ObjectParameter("Gender", gender) :
                new ObjectParameter("Gender", typeof(string));
    
            var nombresParameter = nombres != null ?
                new ObjectParameter("Nombres", nombres) :
                new ObjectParameter("Nombres", typeof(string));
    
            var apellidosParameter = apellidos != null ?
                new ObjectParameter("Apellidos", apellidos) :
                new ObjectParameter("Apellidos", typeof(string));
    
            var sexoParameter = sexo != null ?
                new ObjectParameter("Sexo", sexo) :
                new ObjectParameter("Sexo", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var teléfono_móvilParameter = teléfono_móvil != null ?
                new ObjectParameter("Teléfono_móvil", teléfono_móvil) :
                new ObjectParameter("Teléfono_móvil", typeof(string));
    
            var sin_celularParameter = sin_celular != null ?
                new ObjectParameter("Sin_celular", sin_celular) :
                new ObjectParameter("Sin_celular", typeof(string));
    
            var teléfonoParameter = teléfono != null ?
                new ObjectParameter("Teléfono", teléfono) :
                new ObjectParameter("Teléfono", typeof(string));
    
            var cURPParameter = cURP != null ?
                new ObjectParameter("CURP", cURP) :
                new ObjectParameter("CURP", typeof(string));
    
            var direcciónParameter = dirección != null ?
                new ObjectParameter("Dirección", dirección) :
                new ObjectParameter("Dirección", typeof(string));
    
            var paísParameter = país != null ?
                new ObjectParameter("País", país) :
                new ObjectParameter("País", typeof(string));
    
            var estadoParameter = estado != null ?
                new ObjectParameter("Estado", estado) :
                new ObjectParameter("Estado", typeof(string));
    
            var ciudadParameter = ciudad != null ?
                new ObjectParameter("Ciudad", ciudad) :
                new ObjectParameter("Ciudad", typeof(string));
    
            var cPParameter = cP != null ?
                new ObjectParameter("CP", cP) :
                new ObjectParameter("CP", typeof(string));
    
            var número_exteriorParameter = número_exterior != null ?
                new ObjectParameter("Número_exterior", número_exterior) :
                new ObjectParameter("Número_exterior", typeof(string));
    
            var número_interiorParameter = número_interior != null ?
                new ObjectParameter("Número_interior", número_interior) :
                new ObjectParameter("Número_interior", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("proc_PatientUpdate", patientIDParameter, nameParameter, phoneParameter, addressParameter, birthDateParameter, genderParameter, nombresParameter, apellidosParameter, sexoParameter, emailParameter, teléfono_móvilParameter, sin_celularParameter, teléfonoParameter, cURPParameter, direcciónParameter, paísParameter, estadoParameter, ciudadParameter, cPParameter, número_exteriorParameter, número_interiorParameter);
        }
    
        public virtual ObjectResult<RetrieveBillHistory_Result> RetrieveBillHistory(Nullable<int> pID, ObjectParameter count)
        {
            var pIDParameter = pID.HasValue ?
                new ObjectParameter("pID", pID) :
                new ObjectParameter("pID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RetrieveBillHistory_Result>("RetrieveBillHistory", pIDParameter, count);
        }
    
        public virtual int RetrieveCurrentAppointment(Nullable<int> pID, ObjectParameter dName, ObjectParameter timings, ObjectParameter count)
        {
            var pIDParameter = pID.HasValue ?
                new ObjectParameter("pID", pID) :
                new ObjectParameter("pID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RetrieveCurrentAppointment", pIDParameter, dName, timings, count);
        }
    
        public virtual ObjectResult<RetrieveDeptDoctorInfo_Result> RetrieveDeptDoctorInfo(string deptName)
        {
            var deptNameParameter = deptName != null ?
                new ObjectParameter("deptName", deptName) :
                new ObjectParameter("deptName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RetrieveDeptDoctorInfo_Result>("RetrieveDeptDoctorInfo", deptNameParameter);
        }
    
        public virtual int RetrieveDoctorData(Nullable<int> dID, ObjectParameter name, ObjectParameter phone, ObjectParameter gender, ObjectParameter charges, ObjectParameter rI, ObjectParameter pTreated, ObjectParameter qualification, ObjectParameter specialization, ObjectParameter workE, ObjectParameter age)
        {
            var dIDParameter = dID.HasValue ?
                new ObjectParameter("dID", dID) :
                new ObjectParameter("dID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RetrieveDoctorData", dIDParameter, name, phone, gender, charges, rI, pTreated, qualification, specialization, workE, age);
        }
    
        public virtual int RetrieveFreeSlots(Nullable<int> dID, Nullable<int> pID, ObjectParameter count)
        {
            var dIDParameter = dID.HasValue ?
                new ObjectParameter("dID", dID) :
                new ObjectParameter("dID", typeof(int));
    
            var pIDParameter = pID.HasValue ?
                new ObjectParameter("pID", pID) :
                new ObjectParameter("pID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RetrieveFreeSlots", dIDParameter, pIDParameter, count);
        }
    
        public virtual int RetrievePatientData(Nullable<int> iD, ObjectParameter name, ObjectParameter phone, ObjectParameter address, ObjectParameter birthDate, ObjectParameter age, ObjectParameter gender)
        {
            var iDParameter = iD.HasValue ?
                new ObjectParameter("ID", iD) :
                new ObjectParameter("ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RetrievePatientData", iDParameter, name, phone, address, birthDate, age, gender);
        }
    
        public virtual int RetrievePatientNotifications(Nullable<int> pID, ObjectParameter dName, ObjectParameter timings, ObjectParameter count)
        {
            var pIDParameter = pID.HasValue ?
                new ObjectParameter("pID", pID) :
                new ObjectParameter("pID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RetrievePatientNotifications", pIDParameter, dName, timings, count);
        }
    
        public virtual int retrievePendingFeedback(Nullable<int> pID, ObjectParameter dName, ObjectParameter timings, ObjectParameter aID, ObjectParameter count)
        {
            var pIDParameter = pID.HasValue ?
                new ObjectParameter("pID", pID) :
                new ObjectParameter("pID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("retrievePendingFeedback", pIDParameter, dName, timings, aID, count);
        }
    
        public virtual ObjectResult<retrievePHistory_Result> retrievePHistory(Nullable<int> dID)
        {
            var dIDParameter = dID.HasValue ?
                new ObjectParameter("dID", dID) :
                new ObjectParameter("dID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<retrievePHistory_Result>("retrievePHistory", dIDParameter);
        }
    
        public virtual ObjectResult<RetrieveTreatmentHistory_Result> RetrieveTreatmentHistory(Nullable<int> pID, ObjectParameter count)
        {
            var pIDParameter = pID.HasValue ?
                new ObjectParameter("pID", pID) :
                new ObjectParameter("pID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RetrieveTreatmentHistory_Result>("RetrieveTreatmentHistory", pIDParameter, count);
        }
    
        public virtual int storeFeedback(Nullable<int> aID)
        {
            var aIDParameter = aID.HasValue ?
                new ObjectParameter("aID", aID) :
                new ObjectParameter("aID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("storeFeedback", aIDParameter);
        }
    
        public virtual ObjectResult<TODAYS_APPOINTMENTS_Result> TODAYS_APPOINTMENTS(Nullable<int> dOC_ID)
        {
            var dOC_IDParameter = dOC_ID.HasValue ?
                new ObjectParameter("DOC_ID", dOC_ID) :
                new ObjectParameter("DOC_ID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<TODAYS_APPOINTMENTS_Result>("TODAYS_APPOINTMENTS", dOC_IDParameter);
        }
    
        public virtual int UpdatePrescription(Nullable<int> docId, Nullable<int> appointid, string disease, string progress, string prescription)
        {
            var docIdParameter = docId.HasValue ?
                new ObjectParameter("docId", docId) :
                new ObjectParameter("docId", typeof(int));
    
            var appointidParameter = appointid.HasValue ?
                new ObjectParameter("appointid", appointid) :
                new ObjectParameter("appointid", typeof(int));
    
            var diseaseParameter = disease != null ?
                new ObjectParameter("Disease", disease) :
                new ObjectParameter("Disease", typeof(string));
    
            var progressParameter = progress != null ?
                new ObjectParameter("Progress", progress) :
                new ObjectParameter("Progress", typeof(string));
    
            var prescriptionParameter = prescription != null ?
                new ObjectParameter("Prescription", prescription) :
                new ObjectParameter("Prescription", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UpdatePrescription", docIdParameter, appointidParameter, diseaseParameter, progressParameter, prescriptionParameter);
        }
    }
}
