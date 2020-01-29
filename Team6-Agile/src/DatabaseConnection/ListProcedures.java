package DatabaseConnection;

import java.sql.*;
import java.util.regex.Pattern;

/**
 * @author Cameron McNeill
 */
public class ListProcedures {
    
    // Pattern to check the input for each function
    Pattern code_pattern = Pattern.compile("\\d{3}");
    
    
    // Call an SQL command on the database and return a 2D array of objects containing the output
    private Object[][] searchSQL(String sql) {
        try {            
            ResultSet rs = getConnection().executeQuery(sql);
            return getResult(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    };
    
    
    // The following methods are all searching with a procedure code
    // Each one calls the appropriate stored procedure depending on the parameters passed
    public Object[][] getData(String input) {
        String func_name = (code_pattern.matcher(input).matches()) ? "searchCode" : "searchName";
        return searchSQL("call " + func_name + "('" + input + "')");
    };
    
    public Object[][] getData(String input, String state) {
        String func_name = (code_pattern.matcher(input).matches()) ? "searchCodeByState" : "searchNameByState";
        return searchSQL("call " + func_name + "('" + input + "', '" + state + "')");
    };
    
    public Object[][] getData(String input, String state, int min_price, int max_price) {
        String func_name = (code_pattern.matcher(input).matches()) ? "searchCodeByStateInPriceRange" : "searchNameByStateInPriceRange";
        return searchSQL("call " + func_name + "('" + input + "', '" + state + "', '" + min_price + "', '" + max_price + "')");
    };
    
    public Object[][] getData(String input, int min_price, int max_price) {
        String func_name = (code_pattern.matcher(input).matches()) ? "searchCodeInPriceRange" : "searchNameInPriceRange";
        return searchSQL("call " + func_name + "('" + input + "', '" + min_price + "', '" + max_price + "')");
    };
    
    public Object[][] getData(String input, int max_price) {
        String func_name = (code_pattern.matcher(input).matches()) ? "searchCodeMaxPrice" : "searchNameMaxPrice";
        return searchSQL("call " + func_name + "('" + input + "', '" + max_price + "')");                
    };
    
    
    
    // Gets the maximum price from the database and returns it as a float
    // Used to set the max value on the GUI slider
    public float getMaxPrice() {
        try {
            ResultSet rs = getConnection().executeQuery("call findMaxPrice()");
            rs.next();
            return rs.getFloat(1);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
    
    
    // Takes the result set from the database connection and converts it into an array 
    // of objects. This is used to display the data
    // Return a 2D array of objects    
    private Object[][] getResult(ResultSet rs){
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            int width = rsmd.getColumnCount();
            
            rs.last();
            int height = rs.getRow();
            rs.first();
            
            Object[][] results = new String[height][width];
            for (int i = 0; i < height; i++) {
                for(int j =0 ; j< width ; j++){
                    results[i][j] = rs.getString(j+1);
                }
                rs.next();
            }
            return results;
        }catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    // Creates the connection to the database and returns a statement object to be used
    // when calling an SQL statement on the database
    private Statement getConnection() {
        try {            
            Connection con = DriverManager.getConnection("jdbc:mysql://162.241.24.176:3306/cammymcn_Team6-Agile", 
                                                         "cammymcn_AglUser", 
                                                         "Team6Agile");
            Statement stmt = con.createStatement();
            
            return stmt;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}