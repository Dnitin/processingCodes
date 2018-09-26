import java.util.*;

class Grid {
    private int size;
    private Integer[][] grid;

    public Grid(int size) {
        this.size = size;
        this.grid = new Integer[size][size];
        for(int i=0;i<size;i++)
            for (int j=0;j<size;j++)
                grid[i][j]=0;
    }
    
    public void drawGrid() {
      int scale = width/size;
      int margin = (width/(size))/2;
      int shapeDim = width/size/6;
      
      
        for(int i=0;i<this.size;i++) {
          line(margin + scale*i, margin, margin + scale*i, width-margin);
          line(margin, margin + scale*i, width-margin, margin + scale*i);
        }
        for (int i = 0; i < size; i++){
            for (int j = 0; j < size; j++) {
                if(grid[i][j]==-1) {
                  rect(margin + scale*i - shapeDim/2, margin + scale*j - shapeDim/2, shapeDim, shapeDim);  
                }
                else if(grid[i][j]==1) {
                  ellipse(margin + scale*i, margin + scale*j, shapeDim, shapeDim);
                }
            }
        }
    }

    public void showGrid() {
        for (int i = 0; i < size; i++){
            for (int j = 0; j < size; j++) {
                System.out.print(grid[i][j] + "  ");
            }
            System.out.println();
        }
        System.out.println();
    }

    public boolean isNeighbour(Coordinates c1, Coordinates c2) {
        List<Coordinates> neighbour = neighbourNode(c1);
        return neighbour.contains(c2);
    }

    public List<Coordinates> neighbourNode(Coordinates c) {

        List<Coordinates> neighbour = new ArrayList<Coordinates>();
        if(c.y-1>=0) neighbour.add(new Coordinates(c.x,c.y-1));   //west
        if(c.x-1>=0) neighbour.add(new Coordinates(c.x-1,c.y));   //north
        if(c.x+1<size) neighbour.add(new Coordinates(c.x+1,c.y)); //east
        if(c.y+1<size) neighbour.add(new Coordinates(c.x,c.y+1)); //south

        return neighbour;
    }

    public int whatState(Coordinates c) {
        return grid[c.x][c.y];
    }

    public int getSize() {
        return size;
    }

    public void removeBlock(Coordinates c) {
        grid[c.x][c.y] = 0;
    }

    public void markCrossing(Coordinates c, int state) {
        grid[c.x][c.y] = state;
    }
}
