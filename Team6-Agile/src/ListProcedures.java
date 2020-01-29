import java.sql.*;

public class ListProcedures {
    
    // Call an SQL command on the database and return a 2D array of objects containing the output
    public Object[][] searchSQL(String sql) {
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
    public Object[][] searchWithCode(String code) {
        return searchSQL("call searchCode('" + code + "')");
    };
    
    public Object[][] searchWithCode(String code, String state) {
        return searchSQL("call searchCodeByState('" + code + "', '" + state + "')");
    };
    
    public Object[][] searchWithCode(String code, String state, int min_price, int max_price) {
        return searchSQL("call searchCodeByStateInPriceRange('" + code + "', '" + state + "', '" + min_price + "', '" + max_price + "')");
    };
    
    public Object[][] searchWithCode(String code, int min_price, int max_price) {
        return searchSQL("call searchCodeInPriceRange('" + code + "', '" + min_price + "', '" + max_price + "')");
    };
    
    public Object[][] searchWithCode(String code, int max_price) {
        return searchSQL("call searchCodeMaxPrice('" + code + "', '" + max_price + "')");
    };
    
    
    // The following methods are all searching with a procedure name (partial mathes included)
    // Each one calls the appropriate stored procedure depending on the parameters passed
    public Object[][] searchWithName(String name) {
        return searchSQL("call searchName('" + name + "')");
    };    
    
    public Object[][] searchWithName(String name, String state) {
        return searchSQL("call searchNameByState('" + name + "', '" + state + "')");
    };
    
    public Object[][] searchWithName(String name, String state, int min_price, int max_price) {
        return searchSQL("call searchNameByStateInPriceRange('" + name + "', '" + state + "', '" + min_price + "', '" + max_price + "')");
    };
    
    public Object[][] searchWithName(String name, int min_price, int max_price) {
        return searchSQL("call searchNameInPriceRange('" + name + "', '" + min_price + "', '" + max_price + "')");
    };
    
    public Object[][] searchWithName(String name, int max_price) {
        return searchSQL("call searchNameMaxPrice('" + name + "', '" + max_price + "')");
    };
    
    
    // Takes the result set from the database connection and converts it into an array 
    // of objects. This is used to display the data
    // Return a 2D array of objects    
    public Object[][] getResult(ResultSet rs){
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
    public Statement getConnection() {
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