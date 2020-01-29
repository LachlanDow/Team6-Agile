package DatabaseConnection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * @author Cameron McNeill
 */
public class ListProceduresTest {
    
    public ListProceduresTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    
    
    @Test
    public void testSearchWithCodeDataExample() {
        System.out.println("testSearchWithCodeDataExample");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("023");
        assertEquals("Value returned was not what was wanted",
                     "023 - CRANIOTOMY W MAJOR DEVICE IMPLANT OR ACUTE CNS PDX W MCC OR CHEMOTHE",
                     results[0][0]);
    }
    
    
    @Test
    public void getDataCode() {
        System.out.println("getData - Procedure Code");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("023");
        assertNotNull(results);
    }
    
    @Test
    public void getDataCodeState() {
        System.out.println("getData - Procedure Code - State");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("023", "CA");
        assertNotNull(results);
    }
    
    @Test
    public void getDataCodeStatePriceRange() {
        System.out.println("getData - Procedure Code - State in Price Range");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("023", "CA", 1, 10);
        assertNotNull(results);
    }
    
    @Test
    public void getDataCodePriceRange() {
        System.out.println("getData - Procedure Code - In Price Range");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("023", 1, 10);
        assertNotNull(results);
    }
    
    @Test
    public void getDataCodeMaxPrice() {
        System.out.println("getData - Procedure Code - Max Price");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("023", 10);
        assertNotNull(results);
    }
    
    
    
    @Test
    public void getDataName() {
        System.out.println("getData - Procedure Name");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("CRANIOTOMY");
        assertNotNull(results);
    }
    
    @Test
    public void getDataNameState() {
        System.out.println("getData - Procedure Name - State");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("CRANIOTOMY", "CA");
        assertNotNull(results);
    }
    
    @Test
    public void getDataNameStatePriceRange() {
        System.out.println("getData - Procedure Name - State in Price Range");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("CRANIOTOMY", "CA", 1, 10);
        assertNotNull(results);
    }
    
    @Test
    public void getDataNamePriceRange() {
        System.out.println("getData - Procedure Name - In Price Range");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("CRANIOTOMY", 1, 10);
        assertNotNull(results);
    }
    
    @Test
    public void getDataNameMaxPrice() {
        System.out.println("getData - Procedure Name - Max Price");
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getData("CRANIOTOMY", 10);
        assertNotNull(results);
    }
    
    
    
    @Test
    public void testGetMaxPrice() {
        System.out.println("getMaxPrice");
        ListProcedures lp = new ListProcedures();
        float result = lp.getMaxPrice();
        assertNotEquals("-1", result);
    }
    
    
    
    
    
    
    
    private void printData(Object[][] output) {
        for (int i = 0; i < output.length; i++) {
            for(int j = 0; j < output[0].length ; j++){
                System.out.println(output[i][j].toString());
            }
            System.out.println();
        }
    }
}
