/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package runlength;
import java.util.Scanner;
/**
 *
 * @author hailezeleke
 */
public class Runlength {

    public static String encode(String input) {
        StringBuilder e = new StringBuilder();
        for (int i = 0; i < input.length(); i++) {
            int c = 1;
            while (i + 1 < input.length() && input.charAt(i) == input.charAt(i + 1)) {
                c++;
                i++;
            }
            if (c > 4) {
                e.append("/");
                if (c < 10) {
                    e.append("0");
                }
                e.append(c);
                e.append(input.charAt(i));
            } else {
                for (int j = 1; j < c+1; j++) {
                    e.append(input.charAt(i));
                }
            }
        }
        return e.toString();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       System.out.println("write a string");
       Scanner keyboard=new Scanner(System.in);
       
      
String n = keyboard.nextLine();
System.out.println(encode(n));

    }
    
}
