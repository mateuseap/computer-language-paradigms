public class Circle extends GeometricForm {
    private double radius;

    public Circle (double radius) {
        this.radius = radius;
    }

    public double calculateArea (double radius) {
        return 3.14*radius*radius;
    }

    public double calculatePerimeter (double radius) {
        return 2*3.14*radius;
    }
}