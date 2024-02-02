
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
    public abstract class _DatosConsulta
    {
        private DataTable dataTable = new DataTable();
        private DataRow currentRow = null;
        private IEnumerator enumerator = null;

        public string ConnectionString = "";

        public _DatosConsulta()
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
                cmd.CommandText = "SELECT * FROM [DatosConsulta] WHERE 1=0";

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
            cmd.CommandText = "[proc_DatosConsultaLoadAll]";
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
        public virtual bool LoadByPrimaryKey()

        {
            bool loaded = false;

            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = new OleDbConnection(this.ConnectionString);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[proc_DatosConsultaLoadByPrimaryKey]";


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

            public static OleDbParameter AppointID
            {
                get
                {
                    return new OleDbParameter("@AppointID", OleDbType.Integer, 0);
                }
            }

            public static OleDbParameter Palergia
            {
                get
                {
                    return new OleDbParameter("@Palergia", OleDbType.WChar, 10);
                }
            }

            public static OleDbParameter Palergiadec
            {
                get
                {
                    return new OleDbParameter("@Palergiadec", OleDbType.WChar, 100);
                }
            }

            public static OleDbParameter Phospre
            {
                get
                {
                    return new OleDbParameter("@Phospre", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pcirpre
            {
                get
                {
                    return new OleDbParameter("@Pcirpre", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pdia
            {
                get
                {
                    return new OleDbParameter("@Pdia", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Penftiro
            {
                get
                {
                    return new OleDbParameter("@Penftiro", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Phipart
            {
                get
                {
                    return new OleDbParameter("@Phipart", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pcardio
            {
                get
                {
                    return new OleDbParameter("@Pcardio", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Ptrauma
            {
                get
                {
                    return new OleDbParameter("@Ptrauma", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pcancer
            {
                get
                {
                    return new OleDbParameter("@Pcancer", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Ptuber
            {
                get
                {
                    return new OleDbParameter("@Ptuber", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Ppatores
            {
                get
                {
                    return new OleDbParameter("@Ppatores", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Ppatogas
            {
                get
                {
                    return new OleDbParameter("@Ppatogas", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Penftrans
            {
                get
                {
                    return new OleDbParameter("@Penftrans", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Penfrenal
            {
                get
                {
                    return new OleDbParameter("@Penfrenal", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Potrospat
            {
                get
                {
                    return new OleDbParameter("@Potrospat", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pactfis
            {
                get
                {
                    return new OleDbParameter("@Pactfis", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Ptab
            {
                get
                {
                    return new OleDbParameter("@Ptab", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Palco
            {
                get
                {
                    return new OleDbParameter("@Palco", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pdroga
            {
                get
                {
                    return new OleDbParameter("@Pdroga", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pvacuna
            {
                get
                {
                    return new OleDbParameter("@Pvacuna", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Potronopat
            {
                get
                {
                    return new OleDbParameter("@Potronopat", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pdiaah
            {
                get
                {
                    return new OleDbParameter("@Pdiaah", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pcardioah
            {
                get
                {
                    return new OleDbParameter("@Pcardioah", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Phipartah
            {
                get
                {
                    return new OleDbParameter("@Phipartah", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Penftiroah
            {
                get
                {
                    return new OleDbParameter("@Penftiroah", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Penfrenalah
            {
                get
                {
                    return new OleDbParameter("@Penfrenalah", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Potroanther
            {
                get
                {
                    return new OleDbParameter("@Potroanther", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pfpmens
            {
                get
                {
                    return new OleDbParameter("@Pfpmens", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pfumens
            {
                get
                {
                    return new OleDbParameter("@Pfumens", OleDbType.WChar, 20);
                }
            }

            public static OleDbParameter Pcarmens
            {
                get
                {
                    return new OleDbParameter("@Pcarmens", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pgesta
            {
                get
                {
                    return new OleDbParameter("@Pgesta", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pp
            {
                get
                {
                    return new OleDbParameter("@Pp", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pc
            {
                get
                {
                    return new OleDbParameter("@Pc", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pa
            {
                get
                {
                    return new OleDbParameter("@Pa", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pile
            {
                get
                {
                    return new OleDbParameter("@Pile", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Plcctam
            {
                get
                {
                    return new OleDbParameter("@Plcctam", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Plccsem
            {
                get
                {
                    return new OleDbParameter("@Plccsem", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Psgtam
            {
                get
                {
                    return new OleDbParameter("@Psgtam", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Psgsem
            {
                get
                {
                    return new OleDbParameter("@Psgsem", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pai
            {
                get
                {
                    return new OleDbParameter("@Pai", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pacienteusg
            {
                get
                {
                    return new OleDbParameter("@Pacienteusg", OleDbType.WChar, 4);
                }
            }

            public static OleDbParameter Pembgine
            {
                get
                {
                    return new OleDbParameter("@Pembgine", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pcancer2
            {
                get
                {
                    return new OleDbParameter("@Pcancer2", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Puter
            {
                get
                {
                    return new OleDbParameter("@Puter", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pcanma
            {
                get
                {
                    return new OleDbParameter("@Pcanma", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pactsex
            {
                get
                {
                    return new OleDbParameter("@Pactsex", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pmetplani
            {
                get
                {
                    return new OleDbParameter("@Pmetplani", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pterhormo
            {
                get
                {
                    return new OleDbParameter("@Pterhormo", OleDbType.Boolean, 0);
                }
            }

            public static OleDbParameter Pultpapa
            {
                get
                {
                    return new OleDbParameter("@Pultpapa", OleDbType.WChar, 11);
                }
            }

            public static OleDbParameter Pultmasto
            {
                get
                {
                    return new OleDbParameter("@Pultmasto", OleDbType.WChar, 11);
                }
            }

            public static OleDbParameter Potroagine
            {
                get
                {
                    return new OleDbParameter("@Potroagine", OleDbType.WChar, 20);
                }
            }

        }
        #endregion

        #region ColumnNames
        public class ColumnNames
        {
            public const string AppointID = "AppointID";
            public const string Palergia = "Palergia";
            public const string Palergiadec = "Palergiadec";
            public const string Phospre = "Phospre";
            public const string Pcirpre = "Pcirpre";
            public const string Pdia = "Pdia";
            public const string Penftiro = "Penftiro";
            public const string Phipart = "Phipart";
            public const string Pcardio = "Pcardio";
            public const string Ptrauma = "Ptrauma";
            public const string Pcancer = "Pcancer";
            public const string Ptuber = "Ptuber";
            public const string Ppatores = "Ppatores";
            public const string Ppatogas = "Ppatogas";
            public const string Penftrans = "Penftrans";
            public const string Penfrenal = "Penfrenal";
            public const string Potrospat = "Potrospat";
            public const string Pactfis = "Pactfis";
            public const string Ptab = "Ptab";
            public const string Palco = "Palco";
            public const string Pdroga = "Pdroga";
            public const string Pvacuna = "Pvacuna";
            public const string Potronopat = "Potronopat";
            public const string Pdiaah = "Pdiaah";
            public const string Pcardioah = "Pcardioah";
            public const string Phipartah = "Phipartah";
            public const string Penftiroah = "Penftiroah";
            public const string Penfrenalah = "Penfrenalah";
            public const string Potroanther = "Potroanther";
            public const string Pfpmens = "Pfpmens";
            public const string Pfumens = "Pfumens";
            public const string Pcarmens = "Pcarmens";
            public const string Pgesta = "Pgesta";
            public const string Pp = "Pp";
            public const string Pc = "Pc";
            public const string Pa = "Pa";
            public const string Pile = "Pile";
            public const string Plcctam = "Plcctam";
            public const string Plccsem = "Plccsem";
            public const string Psgtam = "Psgtam";
            public const string Psgsem = "Psgsem";
            public const string Pai = "Pai";
            public const string Pacienteusg = "Pacienteusg";
            public const string Pembgine = "Pembgine";
            public const string Pcancer2 = "Pcancer2";
            public const string Puter = "Puter";
            public const string Pcanma = "Pcanma";
            public const string Pactsex = "Pactsex";
            public const string Pmetplani = "Pmetplani";
            public const string Pterhormo = "Pterhormo";
            public const string Pultpapa = "Pultpapa";
            public const string Pultmasto = "Pultmasto";
            public const string Potroagine = "Potroagine";

        }
        #endregion

        public bool IsColumnNull(string columnName)
        {
            return this.currentRow.IsNull(columnName);
        }

        //=================================================================
        //  Properties Generated from the Table                        
        //=================================================================

        public virtual int? AppointID
        {
            get
            {
                if (currentRow[ColumnNames.AppointID] != DBNull.Value)
                    return (int)currentRow[ColumnNames.AppointID];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.AppointID] = value;
            }
        }

        public virtual string Palergia
        {
            get
            {
                if (currentRow[ColumnNames.Palergia] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Palergia];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Palergia] = value;
            }
        }

        public virtual string Palergiadec
        {
            get
            {
                if (currentRow[ColumnNames.Palergiadec] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Palergiadec];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Palergiadec] = value;
            }
        }

        public virtual bool? Phospre
        {
            get
            {
                if (currentRow[ColumnNames.Phospre] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Phospre];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Phospre] = value;
            }
        }

        public virtual bool? Pcirpre
        {
            get
            {
                if (currentRow[ColumnNames.Pcirpre] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pcirpre];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcirpre] = value;
            }
        }

        public virtual bool? Pdia
        {
            get
            {
                if (currentRow[ColumnNames.Pdia] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pdia];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pdia] = value;
            }
        }

        public virtual bool? Penftiro
        {
            get
            {
                if (currentRow[ColumnNames.Penftiro] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Penftiro];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Penftiro] = value;
            }
        }

        public virtual bool? Phipart
        {
            get
            {
                if (currentRow[ColumnNames.Phipart] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Phipart];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Phipart] = value;
            }
        }

        public virtual bool? Pcardio
        {
            get
            {
                if (currentRow[ColumnNames.Pcardio] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pcardio];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcardio] = value;
            }
        }

        public virtual bool? Ptrauma
        {
            get
            {
                if (currentRow[ColumnNames.Ptrauma] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Ptrauma];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Ptrauma] = value;
            }
        }

        public virtual bool? Pcancer
        {
            get
            {
                if (currentRow[ColumnNames.Pcancer] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pcancer];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcancer] = value;
            }
        }

        public virtual bool? Ptuber
        {
            get
            {
                if (currentRow[ColumnNames.Ptuber] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Ptuber];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Ptuber] = value;
            }
        }

        public virtual bool? Ppatores
        {
            get
            {
                if (currentRow[ColumnNames.Ppatores] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Ppatores];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Ppatores] = value;
            }
        }

        public virtual bool? Ppatogas
        {
            get
            {
                if (currentRow[ColumnNames.Ppatogas] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Ppatogas];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Ppatogas] = value;
            }
        }

        public virtual bool? Penftrans
        {
            get
            {
                if (currentRow[ColumnNames.Penftrans] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Penftrans];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Penftrans] = value;
            }
        }

        public virtual bool? Penfrenal
        {
            get
            {
                if (currentRow[ColumnNames.Penfrenal] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Penfrenal];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Penfrenal] = value;
            }
        }

        public virtual bool? Potrospat
        {
            get
            {
                if (currentRow[ColumnNames.Potrospat] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Potrospat];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Potrospat] = value;
            }
        }

        public virtual bool? Pactfis
        {
            get
            {
                if (currentRow[ColumnNames.Pactfis] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pactfis];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pactfis] = value;
            }
        }

        public virtual bool? Ptab
        {
            get
            {
                if (currentRow[ColumnNames.Ptab] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Ptab];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Ptab] = value;
            }
        }

        public virtual bool? Palco
        {
            get
            {
                if (currentRow[ColumnNames.Palco] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Palco];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Palco] = value;
            }
        }

        public virtual bool? Pdroga
        {
            get
            {
                if (currentRow[ColumnNames.Pdroga] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pdroga];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pdroga] = value;
            }
        }

        public virtual bool? Pvacuna
        {
            get
            {
                if (currentRow[ColumnNames.Pvacuna] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pvacuna];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pvacuna] = value;
            }
        }

        public virtual bool? Potronopat
        {
            get
            {
                if (currentRow[ColumnNames.Potronopat] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Potronopat];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Potronopat] = value;
            }
        }

        public virtual bool? Pdiaah
        {
            get
            {
                if (currentRow[ColumnNames.Pdiaah] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pdiaah];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pdiaah] = value;
            }
        }

        public virtual bool? Pcardioah
        {
            get
            {
                if (currentRow[ColumnNames.Pcardioah] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pcardioah];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcardioah] = value;
            }
        }

        public virtual bool? Phipartah
        {
            get
            {
                if (currentRow[ColumnNames.Phipartah] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Phipartah];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Phipartah] = value;
            }
        }

        public virtual bool? Penftiroah
        {
            get
            {
                if (currentRow[ColumnNames.Penftiroah] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Penftiroah];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Penftiroah] = value;
            }
        }

        public virtual bool? Penfrenalah
        {
            get
            {
                if (currentRow[ColumnNames.Penfrenalah] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Penfrenalah];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Penfrenalah] = value;
            }
        }

        public virtual bool? Potroanther
        {
            get
            {
                if (currentRow[ColumnNames.Potroanther] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Potroanther];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Potroanther] = value;
            }
        }

        public virtual string Pfpmens
        {
            get
            {
                if (currentRow[ColumnNames.Pfpmens] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pfpmens];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pfpmens] = value;
            }
        }

        public virtual string Pfumens
        {
            get
            {
                if (currentRow[ColumnNames.Pfumens] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pfumens];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pfumens] = value;
            }
        }

        public virtual string Pcarmens
        {
            get
            {
                if (currentRow[ColumnNames.Pcarmens] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pcarmens];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcarmens] = value;
            }
        }

        public virtual string Pgesta
        {
            get
            {
                if (currentRow[ColumnNames.Pgesta] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pgesta];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pgesta] = value;
            }
        }

        public virtual string Pp
        {
            get
            {
                if (currentRow[ColumnNames.Pp] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pp];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pp] = value;
            }
        }

        public virtual string Pc
        {
            get
            {
                if (currentRow[ColumnNames.Pc] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pc];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pc] = value;
            }
        }

        public virtual string Pa
        {
            get
            {
                if (currentRow[ColumnNames.Pa] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pa];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pa] = value;
            }
        }

        public virtual string Pile
        {
            get
            {
                if (currentRow[ColumnNames.Pile] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pile];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pile] = value;
            }
        }

        public virtual string Plcctam
        {
            get
            {
                if (currentRow[ColumnNames.Plcctam] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Plcctam];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Plcctam] = value;
            }
        }

        public virtual string Plccsem
        {
            get
            {
                if (currentRow[ColumnNames.Plccsem] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Plccsem];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Plccsem] = value;
            }
        }

        public virtual string Psgtam
        {
            get
            {
                if (currentRow[ColumnNames.Psgtam] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Psgtam];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Psgtam] = value;
            }
        }

        public virtual string Psgsem
        {
            get
            {
                if (currentRow[ColumnNames.Psgsem] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Psgsem];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Psgsem] = value;
            }
        }

        public virtual string Pai
        {
            get
            {
                if (currentRow[ColumnNames.Pai] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pai];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pai] = value;
            }
        }

        public virtual string Pacienteusg
        {
            get
            {
                if (currentRow[ColumnNames.Pacienteusg] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pacienteusg];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pacienteusg] = value;
            }
        }

        public virtual bool? Pembgine
        {
            get
            {
                if (currentRow[ColumnNames.Pembgine] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pembgine];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pembgine] = value;
            }
        }

        public virtual bool? Pcancer2
        {
            get
            {
                if (currentRow[ColumnNames.Pcancer2] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pcancer2];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcancer2] = value;
            }
        }

        public virtual bool? Puter
        {
            get
            {
                if (currentRow[ColumnNames.Puter] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Puter];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Puter] = value;
            }
        }

        public virtual bool? Pcanma
        {
            get
            {
                if (currentRow[ColumnNames.Pcanma] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pcanma];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pcanma] = value;
            }
        }

        public virtual bool? Pactsex
        {
            get
            {
                if (currentRow[ColumnNames.Pactsex] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pactsex];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pactsex] = value;
            }
        }

        public virtual bool? Pmetplani
        {
            get
            {
                if (currentRow[ColumnNames.Pmetplani] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pmetplani];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pmetplani] = value;
            }
        }

        public virtual bool? Pterhormo
        {
            get
            {
                if (currentRow[ColumnNames.Pterhormo] != DBNull.Value)
                    return (bool)currentRow[ColumnNames.Pterhormo];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pterhormo] = value;
            }
        }

        public virtual string Pultpapa
        {
            get
            {
                if (currentRow[ColumnNames.Pultpapa] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pultpapa];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pultpapa] = value;
            }
        }

        public virtual string Pultmasto
        {
            get
            {
                if (currentRow[ColumnNames.Pultmasto] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Pultmasto];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Pultmasto] = value;
            }
        }

        public virtual string Potroagine
        {
            get
            {
                if (currentRow[ColumnNames.Potroagine] != DBNull.Value)
                    return (string)currentRow[ColumnNames.Potroagine];
                else
                    return null;


            }

            set
            {
                currentRow[ColumnNames.Potroagine] = value;
            }
        }


        protected OleDbCommand CreateInsertCommand()
        {

            OleDbCommand cmd = CreateParameters();
            cmd.CommandText = "[proc_DatosConsultaInsert]";

            return cmd;
        }

        protected OleDbCommand CreateUpdateCommand()
        {

            OleDbCommand cmd = CreateParameters();
            cmd.CommandText = "[proc_DatosConsultaUpdate]";

            return cmd;
        }

        protected OleDbCommand CreateDeleteCommand()
        {

            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[proc_DatosConsultaDelete]";

            OleDbParameter p;


            return cmd;
        }

        protected OleDbCommand CreateParameters()
        {
            OleDbParameter p;

            OleDbCommand cmd = new OleDbCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            // Add params

            p = cmd.Parameters.Add(Parameters.AppointID);
            p.SourceColumn = "AppointID";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Palergia);
            p.SourceColumn = "Palergia";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Palergiadec);
            p.SourceColumn = "Palergiadec";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Phospre);
            p.SourceColumn = "Phospre";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcirpre);
            p.SourceColumn = "Pcirpre";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pdia);
            p.SourceColumn = "Pdia";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Penftiro);
            p.SourceColumn = "Penftiro";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Phipart);
            p.SourceColumn = "Phipart";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcardio);
            p.SourceColumn = "Pcardio";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Ptrauma);
            p.SourceColumn = "Ptrauma";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcancer);
            p.SourceColumn = "Pcancer";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Ptuber);
            p.SourceColumn = "Ptuber";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Ppatores);
            p.SourceColumn = "Ppatores";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Ppatogas);
            p.SourceColumn = "Ppatogas";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Penftrans);
            p.SourceColumn = "Penftrans";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Penfrenal);
            p.SourceColumn = "Penfrenal";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Potrospat);
            p.SourceColumn = "Potrospat";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pactfis);
            p.SourceColumn = "Pactfis";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Ptab);
            p.SourceColumn = "Ptab";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Palco);
            p.SourceColumn = "Palco";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pdroga);
            p.SourceColumn = "Pdroga";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pvacuna);
            p.SourceColumn = "Pvacuna";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Potronopat);
            p.SourceColumn = "Potronopat";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pdiaah);
            p.SourceColumn = "Pdiaah";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcardioah);
            p.SourceColumn = "Pcardioah";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Phipartah);
            p.SourceColumn = "Phipartah";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Penftiroah);
            p.SourceColumn = "Penftiroah";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Penfrenalah);
            p.SourceColumn = "Penfrenalah";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Potroanther);
            p.SourceColumn = "Potroanther";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pfpmens);
            p.SourceColumn = "Pfpmens";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pfumens);
            p.SourceColumn = "Pfumens";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcarmens);
            p.SourceColumn = "Pcarmens";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pgesta);
            p.SourceColumn = "Pgesta";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pp);
            p.SourceColumn = "Pp";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pc);
            p.SourceColumn = "Pc";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pa);
            p.SourceColumn = "Pa";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pile);
            p.SourceColumn = "Pile";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Plcctam);
            p.SourceColumn = "Plcctam";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Plccsem);
            p.SourceColumn = "Plccsem";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Psgtam);
            p.SourceColumn = "Psgtam";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Psgsem);
            p.SourceColumn = "Psgsem";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pai);
            p.SourceColumn = "Pai";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pacienteusg);
            p.SourceColumn = "Pacienteusg";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pembgine);
            p.SourceColumn = "Pembgine";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcancer2);
            p.SourceColumn = "Pcancer2";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Puter);
            p.SourceColumn = "Puter";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pcanma);
            p.SourceColumn = "Pcanma";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pactsex);
            p.SourceColumn = "Pactsex";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pmetplani);
            p.SourceColumn = "Pmetplani";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pterhormo);
            p.SourceColumn = "Pterhormo";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pultpapa);
            p.SourceColumn = "Pultpapa";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Pultmasto);
            p.SourceColumn = "Pultmasto";
            p.SourceVersion = DataRowVersion.Current;

            p = cmd.Parameters.Add(Parameters.Potroagine);
            p.SourceColumn = "Potroagine";
            p.SourceVersion = DataRowVersion.Current;


            return cmd;
        }
    }
}