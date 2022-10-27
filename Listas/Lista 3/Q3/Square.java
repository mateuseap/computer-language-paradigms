public class Square extends GeometricForm {
    private double side;

    public Square (double side) {
        this.side = side;
    }

    public double calculateArea (double side) {
        return side*side;
    }

    public double calculatePerimeter (double side) {
        return 4*side;
    }
}