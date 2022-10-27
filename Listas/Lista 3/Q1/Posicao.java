public class Position {
    private class int x, y;

    public Position (int x, int y) {
        this.x = x;
        this.y = y;
    }

    public void setPosX (int x) {
        this.x = x;
    }

    public float getPosX () {
        return this.x;
    }

    public void setPosY (int y) {
        this.y = y;
    }

    public float getPosY () {
        return this.y;
    }
}