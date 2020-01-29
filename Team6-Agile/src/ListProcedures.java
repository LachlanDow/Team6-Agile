import java.sql.*;

public class ListProcedures {
    
    public String[][] searchWithCode(String code) {
        try {            
            ResultSet rs = getConnection().executeQuery("call searchCode('" + code + "')");
            return getResult(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    };
    
    
    public String[][] searchWithName(String Name) {
        try {            
            ResultSet rs = getConnection().executeQuery("call searchName('" + Name + "')");
            return getResult(rs);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    };
    
//    public String[][] listAll() {
//        try {          
//            String sql;
//            sql = "SELECT * FROM Procedures";
//            ResultSet rs = getConnection().executeQuery(sql);
//            return getResult(rs);
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    };
    
    
    public String[][] getResult(ResultSet rs){
        String[][] results;
        int width = 7;
        int height = 0;
        try {
            rs.last();
            height = rs.getRow();
            
            results = new String[height][width];

            rs.first();
            
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
    
    
    public Statement getConnection() {
        try {            
            Connection con = DriverManager.getConnection("jdbc:mysql://162.241.24.176:3306/cammymcn_Team6-Agile", 
                                                         "cammymcn_AglAdm", 
                                                         "Team6Agile");
            Statement stmt = con.createStatement();
            
            return stmt;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}