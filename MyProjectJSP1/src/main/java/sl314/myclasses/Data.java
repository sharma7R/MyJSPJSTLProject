
package sl314.myclasses;
import java.sql.*;

public class Data {
	
	public ResultSet rs;
	public Connection con;
	
	public Data(Connection con)
	{
		this.con=con;
	}
	
	public ResultSet reload()
	{
		
		try
		{
	    Statement st=con.createStatement();
		rs=st.executeQuery("select * from employees");
		
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return rs;
		
	}
	
	

}
