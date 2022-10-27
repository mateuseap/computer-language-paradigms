public class Rectangle extends GeometricForm {
    private double length, width;

    public Rectangle (double length, double width) {
        this.length = length;
        this.width = width;
    }

    public double calculateArea (double length, double width) {
        return length*width;
    }

    public double calculatePerimeter (double length, double width) {
        return 2*(length+width);
    }
}