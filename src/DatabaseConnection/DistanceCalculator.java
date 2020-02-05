package DatabaseConnection;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Cameron McNeill
 */
public class DistanceCalculator {
    
    public Object[][] getDistanceList(Object[][] input, int zipcode) {
        
        ListProcedures lp = new ListProcedures();
        
        try {
            ResultSet rs = lp.getConnection().executeQuery("call findLatLong('" + zipcode + "')");
            
            rs.next();
            
            double my_lat = rs.getDouble(2);
            double my_long = rs.getDouble(3);
            
            return getDistanceList(input, my_lat, my_long);
            
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
    public Object[][] getDistanceList(Object[][] input, double my_lat, double my_long) {
        
        try {
            double[] distances = new double[input.length];

            for (int i = 0; i < input.length; i++) {
                double lat1 = Double.parseDouble(input[i][6].toString());
                double long1 = Double.parseDouble(input[i][7].toString());

                distances[i] = getDistance(lat1, long1, my_lat, my_long);
            }

            Object[][] output = new String[input.length][input[0].length + 1];
            
            for (int i = 0; i < output.length; i++) {
                for (int j = 0; j < output[0].length - 1; j++) {
                    if (j == 4) {
                        output[i][j] = String.valueOf(distances[i]);
                        continue;
                    }
                    output[i][j] = input[i][j];
                }
            }
            
            return output;
            
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public double getDistance(double lat1, double long1, double lat2, double long2) {
    
        double r = 6372.8;
        
        double dlat = Math.toRadians(lat2 - lat1);
        double dlong = Math.toRadians(long2 - long1);
        
        lat1 = Math.toRadians(lat1);
        lat2 = Math.toRadians(lat2);
        
        double a = Math.pow(Math.sin(dlat / 2), 2) + 
                   Math.pow(Math.sin(dlong / 2), 2) *
                   Math.cos(lat1) *
                   Math.cos(lat2);
        
        double c = 2 * Math.asin(Math.sqrt(a));
        
        return (r * c);
    }
    
}
