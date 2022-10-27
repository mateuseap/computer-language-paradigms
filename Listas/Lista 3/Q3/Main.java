public class Main {
    public static void main (String[] args) {
        Circle circle = new Circle((double) 3);
        Rectangle rectangle = new Rectangle((double) 10, (double) 5);
        Square square = new Square((double) 8);

        System.out.println("Circle area: \n" + circle.calculateArea());
        System.out.println("Circle perimeter: \n" + circle.calculatePerimeter());

        System.out.println("Rectangle area: \n" + rectangle.calculateArea());
        System.out.println("Rectangle perimeter: \n" + rectangle.calculatePerimeter());

        System.out.println("Square area: \n" + square.calculateArea());
        System.out.println("Square perimeter: \n" + square.calculatePerimeter());
    }
}