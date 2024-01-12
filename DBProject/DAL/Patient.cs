
/*
===============================================================================
  ** IMPORTANT  ** 

   Use 'Access_StoredProcs.vbgen' to generate the stored procs for your table.
  
  This object is 'abstract' which means you need to inherit from it to be able to instantiate it.  This is very
  easilly done. You can override properties and methods in your derived class, this allows you to regenerate
  this class at any time and not worry about overwriting custom code. (see below).

  Also, this object is not meant to be all consuming, without shipping an accompanying architecture this is a pretty good
  sample and can be used as is or taken and further customized, for instance, if you access a field that is dbNull an
  exception will be thrown, it would be better to return say "string.Empty".  Nonetheless, this object is fully function.

  ** IMPORTANT  ** 

	public class Employees : _Employees
	{
	
	}

 ============= Adding a Record =================

	Employees newObj = new Employees();
	newObj.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Access\Northwind.mdb;Persist Security Info=False";
	newObj.AddNew();
	
	// Your Properties will be different here
	newObj.FirstName = "Joe";
	newObj.LastName = "Plank Plank";
	
	newObj.Save();

 ============= Updating A Record  =================

	Employees obj = new Employees();
	obj.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Access\Northwind.mdb;Persist Security Info=False";
	
	if(obj.LoadByPrimaryKey(9))
	{
		// Your Properties will be different here
		obj.LastName = "Plank";
		obj.Save();
	}

 ============= Interating through Records  =================

	Employees obj = new Employees();
	obj.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Access\Northwind.mdb;Persist Security Info=False";
	if(obj.LoadAll())
	{
		obj.Rewind();
		while(obj.MoveNext())
		{
			// Your Properties will be different here
			Console.WriteLine(obj.FirstName);
		}
	}

===============================================================================
*/
using System;
using System.Data;
using System.Data.OleDb;
using System.Collections;

namespace DBProject.DAL
{
    public abstract class _Patient
    {
        private DataTable dataTable = new DataTable();
        private DataRow currentRow = null;
        private IEnumerator enumerator = null;

        public string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon3"].ConnectionString;

        public _Patient()
        {

        }

        /*
		'=================================================================
		'  public Overridable Sub AddNew()
		'=================================================================
		'  Adds a new record to our DataTable, if we haven't loaded any data yet the table has no
		'  structure, so, we do a little trick to get the column by doing a SELECT against the 
		'  table using "WHERE 1=0" which will bring back no data but our DataColumns and 
		'  other information are filled out for us.
		'=================================================================
		*/
        public virtual void AddNew()
        {
            if (dataTable.Rows.Count == 0)
            {
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = new OleDbConnection(this.ConnectionString);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM [Patient] WHERE 1=0";

                OleDbDataAdapter dataAdapter = new OleDbDataAdapter();
                dataAdapter.SelectCommand = cmd;
                dataAdapter.Fill(dataTable);
            }

            currentRow = dataTable.NewRow();
            dataTable.Rows.Add(currentRow);
        }

        /*
		'=================================================================
		'  public virtual bool LoadAll()
		'=================================================================
		'  Loads all of the records in the database, and sets the currentRow to the first row
		'=================================================================
		*/
        public virtual bool LoadAll()
        {
            bool loaded = false;

            OleDbDataAdapter dataAdapter = new OleDbDataAdapter();

            OleDbConnection con = new OleDbConnection(this.ConnectionString);
            OleDbCommand cmd = new OleDbCommand();

            cmd.Connection = con;
            cmd.CommandText = "[proc_PatientLoadAll]";
            cmd.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand = cmd;

            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count > 0)
            {
                currentRow = dataTable.Rows[0];
                loaded = true;
            }

            return loaded;
        }

        /*
		'=================================================================
		' public virtual bool LoadByPrimaryKey()
		'=================================================================
		'  Loads a single row of via the primary key
		'=================================================================
		*/
        public virtual bool LoadByPrimaryKey(int PatientID)

        {
            bool loaded = false;

            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = new OleDbConnection(this.ConnectionString);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[proc_PatientLoadByPrimaryKey]";

            OleDbParameter p;

            p = Parameters.PatientID;
            p.Value = PatientID;
            cmd.Parameters.Add(p);

            OleDbDataAdapter dataAdapter = new OleDbDataAdapter();
            dataAdapter.SelectCommand = cmd;
            dataAdapter.Fill(dataTable);

            if (dataTable.Rows.Count > 0)
            {
                currentRow = dataTable.Rows[0];
                loaded = true;
            }

            return loaded;
        }

        /*
		'=================================================================
		'  public Overridable Sub Save()
		'=================================================================
		'  Saves all changes, including Inserts, Deletes, and Updates. All Computed Columns and
		'  AutoKeys are updated and ready for access immediately after your call to Save()
		'=================================================================
		*/
        public virtual void Save()
        {
            bool inserts = false;
            bool updates = false;
            bool deletes = false;

            if (dataTable.Rows.Count > 0)
            {
                // Do we have any data to save
                foreach (DataRow row in dataTable.Rows)
                {
                    switch (row.RowState)
                    {
                        case DataRowState.Added:
                            inserts = true;
                            break;
                        case DataRowState.Modified:
                            updates = true;
                            break;
                        case DataRowState.Deleted:
                            deletes = true;
                            break;
                    }
                }
            }

            OleDbDataAdapter dataAdapter = new OleDbDataAdapter();
            if (inserts)
            {
                dataAdapter.InsertCommand = this.CreateInsertCommand();
                dataAdapter.InsertCommand.Connection = new OleDbConnection(this.ConnectionString);
            }

            if (updates)
            {
                dataAdapter.UpdateCommand = this.CreateUpdateCommand();
                dataAdapter.UpdateCommand.Connection = new OleDbConnection(this.ConnectionString);
            }

            if (deletes)
            {
                dataAdapter.DeleteCommand = this.CreateDeleteCommand();
                dataAdapter.DeleteCommand.Connection = new OleDbConnection(this.ConnectionString);
            }

            dataAdapter.Update(dataTable);
        }

        /*
		'=================================================================
		'  public virtual void DeleteCurrentRow()
		'=================================================================
		'  NOTE: The most important thing to remember about this method is that it only marks
		'  the record for deletion, you must still call Save() to actually delete it.
		'=================================================================
		*/
        public virtual void DeleteCurrentRow()
        {
            if (currentRow != null)
            {
                currentRow.Delete();
            }
        }

        /*
		'=================================================================
		'  public Function RowState() As DataRowState
		'=================================================================
		'  This will return the actual DataRowState such as Added, Deleted, Modified
		'=================================================================
		*/
        public DataRowState RowState()
        {
            if (dataTable != null && currentRow != null)
            {
                return currentRow.RowState;
            }
            else
            {
                return DataRowState.Detached;
            }
        }

        /*
		'=================================================================
		'  public int RowCount()
		'=================================================================
		'  The number of rows in the object
		'=================================================================
		*/
        public int RowCount
        {
            get
            {
                int count = 0;
                if (dataTable != null)
                {
                    count = dataTable.DefaultView.Count;
                }
                return count;
            }
        }

        /*
		'=================================================================
		'  public voic Rewind()
		'=================================================================
		'  This resets the iteraton, you should call this before you call MoveNext().
		'=================================================================
		*/
        public void Rewind()
        {
            currentRow = null;
            enumerator = null;

            if (dataTable != null)
            {
                if (dataTable.DefaultView.Count > 0)
                {
                    enumerator = dataTable.DefaultView.GetEnumerator();
                    enumerator.MoveNext();
                    DataRowView rowView = enumerator.Current as DataRowView;
                    currentRow = rowView.Row;
                }
            }
        }

        /*
		'=================================================================
		'  public bool MoveNext()
		'=================================================================
		'  This Moves the current row pointer to the next row and returns false if it has reached the
		'  end
		'=================================================================
		*/
        public bool MoveNext()
        {
            bool moved = false;

            if (enumerator != null && enumerator.MoveNext())
            {
                DataRowView rowView = enumerator.Current as DataRowView;
                currentRow = rowView.Row;
                moved = true;
            }

            return moved;
        }

        #region Parameters
        protected class Parameters
        {

            public static OleDbParameter PatientID
            {
                get
                {
                    return new OleDbParameter("@PatientID", OleDbType.Integer, 0);
                }
            }

            public static OleDbParameter Name
            {
                get
                {
                    return new OleDbParameter("@Name", OleDbType.VarChar, 30);
                }
            }

            public static OleDbParameter Phone
            {
                get
                {
                    return new OleDbParameter("@Phone", OleDbType.Char, 11);
                }
            }

            public static OleDbParameter Address
            {
                get
                {
                    return new OleDbParameter("@Address", OleDbType.VarChar, 40);
                }
            }

            public static OleDbParameter BirthDate
            {
                get
                {
                    return new OleDbParameter("@BirthDate", OleDbType.DBDate, 10);
                }
            }

            public static OleDbParameter Gender
            {
                get
                {
                    return new OleDbParameter("@Gender", OleDbType.Char, 1);
                }
            }

            public static OleDbParameter Nombres
            {
                get
                {
                    return new OleDbParameter("@Nombres", OleDbType.WChar, 30);
                }
            }

            public static OleDbParameter Apellidos
            {
                get
                {
                    return new OleDbParameter("@Apellidos", OleDbType.WChar, 30);
                }
            }

            public static OleDbParameter Sexo
            {
                get
                {
                    return new OleDbParameter("@Sexo", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Email
            {
                get
                {
                    return new OleDbParameter("@Email", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Teléfono_móvil
            {
                get
                {
                    return new OleDbParameter("@Teléfono_móvil", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Sin_celular
            {
                get
                {
                    return new OleDbParameter("@Sin_celular", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Teléfono
            {
                get
                {
                    return new OleDbParameter("@Teléfono", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter CURP
            {
                get
                {
                    return new OleDbParameter("@CURP", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Dirección
            {
                get
                {
                    return new OleDbParameter("@Dirección", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter País
            {
                get
                {
                    return new OleDbParameter("@País", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Estado
            {
                get
                {
                    return new OleDbParameter("@Estado", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Ciudad
            {
                get
                {
                    return new OleDbParameter("@Ciudad", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter CP
            {
                get
                {
                    return new OleDbParameter("@CP", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Número_exterior
            {
                get
                {
                    return new OleDbParameter("@Número_exterior", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Número_interior
            {
                get
                {
                    return new OleDbParameter("@Número_interior", OleDbType.WChar, 10);
                }
            }

        }
        #endregion

        #region ColumnNames
        public class ColumnNames
        {
            public const string PatientID = "PatientID";
            public const string Name = "Name";
            public const string Phone = "Phone";
            public const string Address = "Address";
            public const string BirthDate = "BirthDate";
            public const string Gender = "Gender";
            public const string Nombres = "Nombres";
            public const string Apellidos = "Apellidos";
            public const string Sexo = "Sexo";
            public const string Email = "Email";
            public const string Teléfono_móvil = "Teléfono_móvil";
            public const string Sin_celular = "Sin_celular";
            public const string Teléfono = "Teléfono";
            public const string CURP = "CURP";
            public const string Dirección = "Dirección";
            public const string País = "País";
            public const string Estado = "Estado";
            public const string Ciudad = "Ciudad";
            public const string CP = "CP";
            public const string Número_exterior = "Número_exterior";
            public const string Número_interior = "Número_interior";

        }
        #endregion

        public bool IsColumnNull(string columnName)
        {
            return this.currentRow.IsNull(columnName);
        }

        //=================================================================
        //  Properties Generated from the Table                        
        //=================================================================

        public virtual int? PatientID
        {
            get
            {
                if (currentRow[ColumnNames.PatientID] != DBNull.Value)
                    return (int)currentRow[ColumnNames.PatientID];
                else
                    return null;

            }

        }

        public virtual string Name
        {
            get
            {
                if (currentRow[ColumnNames.Name] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Name];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Name] = value;
            }
        }

        public virtual string Phone
        {
            get
            {
                if (currentRow[ColumnNames.Phone] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Phone];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Phone] = value;
            }
        }

        public virtual string Address
        {
            get
            {
                if (currentRow[ColumnNames.Address] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Address];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Address] = value;
            }
        }

        public virtual DateTime? BirthDate
        {
            get
            {
                DateTime? date = null;

                if (currentRow[ColumnNames.BirthDate] != DBNull.Value)
                    return (DateTime)currentRow[ColumnNames.BirthDate];
                else
                    return date;

            }

            set
            {
                currentRow[ColumnNames.BirthDate] = value;
            }
        }

        public virtual string Gender
        {
            get
            {
                if (currentRow[ColumnNames.Gender] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Gender];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Gender] = value;
            }
        }

        public virtual string Nombres
        {
            get
            {
                if (currentRow[ColumnNames.Nombres] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Nombres];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Nombres] = value;
            }
        }

        public virtual string Apellidos
        {
            get
            {
                if (currentRow[ColumnNames.Apellidos] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Apellidos];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Apellidos] = value;
            }
        }

        public virtual string Sexo
        {
            get
            {
                if (currentRow[ColumnNames.Sexo] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Sexo];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Sexo] = value;
            }
        }

        public virtual string Email
        {
            get
            {
                if (currentRow[ColumnNames.Email] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Email];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Email] = value;
            }
        }

        public virtual string Teléfono_móvil
        {
            get
            {
                if (currentRow[ColumnNames.Teléfono_móvil] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Teléfono_móvil];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Teléfono_móvil] = value;
            }
        }

        public virtual string Sin_celular
        {
            get
            {
                if (currentRow[ColumnNames.Sin_celular] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Sin_celular];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Sin_celular] = value;
            }
        }

        public virtual string Teléfono
        {
            get
            {
                if (currentRow[ColumnNames.Teléfono] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Teléfono];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Teléfono] = value;
            }
        }

        public virtual string CURP
        {
            get
            {
                if (currentRow[ColumnNames.CURP] != DBNull.Value)
                    return (string)currentRow[ColumnNames.CURP];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.CURP] = value;
            }
        }

        public virtual string Dirección
        {
            get
            {
                if (currentRow[ColumnNames.Dirección] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Dirección];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Dirección] = value;
            }
        }

        public virtual string País
        {
            get
            {
                if (currentRow[ColumnNames.País] != DBNull.Value)
                    return (string)currentRow[ColumnNames.País];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.País] = value;
            }
        }

        public virtual string Estado
        {
            get
            {
                if (currentRow[ColumnNames.Estado] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Estado];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Estado] = value;
            }
        }

        public virtual string Ciudad
        {
            get
            {
                if (currentRow[ColumnNames.Ciudad] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Ciudad];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Ciudad] = value;
            }
        }

        public virtual string CP
        {
            get
            {
                if (currentRow[ColumnNames.CP] != DBNull.Value)
                    return (string)currentRow[ColumnNames.CP];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.CP] = value;
            }
        }

        public virtual string Número_exterior
        {
            get
            {
                if (currentRow[ColumnNames.Número_exterior] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Número_exterior];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Número_exterior] = value;
            }
        }

        public virtual string Número_interior
        {
            get
            {
                if (currentRow[ColumnNames.Número_interior] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Número_interior];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Número_interior] = value;
            }
        }


        protected OleDbCommand CreateInsertCommand()
        {

            OleDbCommand cmd = CreateParameters();
            cmd.CommandText = "[proc_PatientInsert]";

            return cmd;
        }

        protected OleDbCommand CreateUpdateCommand()
        {

            OleDbCommand cmd = CreateParameters();
            cmd.CommandText = "[proc_PatientUpdate]";

            return cmd;
        }

        protected OleDbCommand CreateDeleteCommand()
        {

            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[proc_PatientDelete]";

            OleDbParameter p;

            p = cmd.Parameters.Add(Parameters.PatientID);
            p.SourceColumn = "PatientID";
            p.SourceVersion = DataRowVersion.Current;


            return cmd;
        }

        protected OleDbCommand CreateParameters()
        {
            OleDbParameter p;

            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            // Add params

            p = cmd.Parameters.Add(Parameters.PatientID);
            p.SourceColumn = "PatientID";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Name);
            p.SourceColumn = "Name";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Phone);
            p.SourceColumn = "Phone";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Address);
            p.SourceColumn = "Address";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.BirthDate);
            p.SourceColumn = "BirthDate";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Gender);
            p.SourceColumn = "Gender";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Nombres);
            p.SourceColumn = "Nombres";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Apellidos);
            p.SourceColumn = "Apellidos";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Sexo);
            p.SourceColumn = "Sexo";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Email);
            p.SourceColumn = "Email";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Teléfono_móvil);
            p.SourceColumn = "Teléfono_móvil";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Sin_celular);
            p.SourceColumn = "Sin_celular";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Teléfono);
            p.SourceColumn = "Teléfono";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.CURP);
            p.SourceColumn = "CURP";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Dirección);
            p.SourceColumn = "Dirección";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.País);
            p.SourceColumn = "País";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Estado);
            p.SourceColumn = "Estado";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Ciudad);
            p.SourceColumn = "Ciudad";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.CP);
            p.SourceColumn = "CP";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Número_exterior);
            p.SourceColumn = "Número_exterior";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Número_interior);
            p.SourceColumn = "Número_interior";
            p.SourceVersion = DataRowVersion.Current;


            return cmd;
        }
    }
}


