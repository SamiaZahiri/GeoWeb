
package controllers;

/**
 *
 * @author Samia
 */
public class Chart {
    
	 private String key;
	    private Long value;

	    public Chart(String key, Long long1) {
	        this.key = key;
	        this.value = long1;
	    }

		@Override
		public String toString() {
			return "Chart [key=" + key + ", value=" + value + "]";
		}
	    
    
}
