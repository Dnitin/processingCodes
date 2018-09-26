import java.util.*;

class Robot {
  
    private List<Coordinates> visitHistory;
    private Grid arenaGrid;
    private Grid inMemoryGrid;
    private Directions directionFacing;
    private Coordinates currentCoordinates;
    
    private int graphicX;
    private int graphicY;

    public Robot(Grid arenaGrid) {
        
        this.graphicX = width/arenaGrid.getSize()/2;
        this.graphicY = width/arenaGrid.getSize()/2;
        this.arenaGrid = arenaGrid;
        inMemoryGrid = new Grid(arenaGrid.getSize());
        //inMemoryGrid.removeBlock(new Coordinates(0,0));
        directionFacing = Directions.SOUTH;
        currentCoordinates = new Coordinates(0,0);
        visitHistory = new ArrayList<Coordinates>();

    }
    
    public void addToVisitHistory(Coordinates c) {
      visitHistory.add(c);
    }
    
    public void updateInMemoryGrid(Coordinates c, int state) {
      inMemoryGrid.markCrossing(c,state);
    }
    
    public void showRobotIncrementFrame(){
      int scale = width/arenaGrid.getSize();
      int margin = width/arenaGrid.getSize()/2;
      int shapeDim = width/arenaGrid.getSize()/8;
      int increment = 0;
      
      while(increment<scale) {
        rect(this.graphicX-shapeDim/2,this.graphicY-shapeDim/2,shapeDim,shapeDim);
      
        switch (directionFacing) {
            case SOUTH:
                ellipse(this.graphicX+shapeDim,this.graphicY,shapeDim,shapeDim);
                graphicX++;
                break;
            case NORTH:
                ellipse(this.graphicX-shapeDim,this.graphicY,shapeDim,shapeDim);
                graphicX--;
                break;
            case WEST:
                ellipse(this.graphicX,this.graphicY-shapeDim,shapeDim,shapeDim);
                graphicY--;
                break;
            case EAST:
                ellipse(this.graphicX,this.graphicY+shapeDim,shapeDim,shapeDim);
                graphicY++;
                break;
                default:
        }
        increment++;
      }
    }

    private void turn180() {
        turnLeft();
        turnLeft();
    }

    private void turnLeft() {
        switch (directionFacing) {
            case SOUTH:
                directionFacing = Directions.EAST;
                break;
            case NORTH:
                directionFacing = Directions.WEST;
                break;
            case WEST:
                directionFacing = Directions.SOUTH;
                break;
            case EAST:
                directionFacing = Directions.NORTH;
                break;
                default:
        }
    }

    private void turnRight() {
        switch (directionFacing) {
            case SOUTH:
                directionFacing = Directions.WEST;
                break;
            case NORTH:
                directionFacing = Directions.EAST;
                break;
            case WEST:
                directionFacing = Directions.NORTH;
                break;
            case EAST:
                directionFacing = Directions.SOUTH;
                break;
            default:
        }
    }

    //should update current coordinate appropriately for traversal to work
    private void robotMovement(Coordinates visitTo) {
        if(visitTo.x < currentCoordinates.x) {
            switch (directionFacing) {
                case EAST:
                    turnLeft();
                    moveUnitSpace();
                    break;
                case WEST:
                    turnRight();
                    moveUnitSpace();
                    break;
                case NORTH:
                    moveUnitSpace();
                    break;
                case SOUTH:
                    turn180();
                    moveUnitSpace();
                    break;
                    default:
            }
        }
        else if(visitTo.x > currentCoordinates.x) {
            switch (directionFacing) {
                case EAST:
                    turnRight();
                    moveUnitSpace();
                    break;
                case WEST:
                    turnLeft();
                    moveUnitSpace();
                    break;
                case NORTH:
                    turn180();
                    moveUnitSpace();
                    break;
                case SOUTH:
                    moveUnitSpace();
                    break;
                default:
            }
        }
        else {
            if (visitTo.y > currentCoordinates.y) {
                switch (directionFacing) {
                    case NORTH:
                        turnRight();
                        moveUnitSpace();
                        break;
                    case SOUTH:
                        turnLeft();
                        moveUnitSpace();
                        break;
                    case WEST:
                        turn180();
                        moveUnitSpace();
                        break;
                    case EAST:
                        moveUnitSpace();
                        break;
                        default:
                }
            }
            else if(visitTo.y < currentCoordinates.y) {
                switch (directionFacing) {
                    case NORTH:
                        turnLeft();
                        moveUnitSpace();
                        break;
                    case SOUTH:
                        turnRight();
                        moveUnitSpace();
                        break;
                    case WEST:
                        moveUnitSpace();
                        break;
                    case EAST:
                        turn180();
                        moveUnitSpace();
                        break;
                    default:
                }
            }
            else {
                System.out.println("Stuck");
            }
        }
    }

    public void visitToNode(Coordinates visitTo) {
        if(arenaGrid.isNeighbour(currentCoordinates,visitTo)) {
            robotMovement(visitTo);
        }
        else {
            ListIterator<Coordinates> iterator = visitHistory.listIterator(visitHistory.size());
            while (iterator.hasPrevious()) {
                Coordinates intoConsideration = iterator.previous();
                if(arenaGrid.isNeighbour(currentCoordinates,intoConsideration)) {
                    robotMovement(intoConsideration);
                }
            }
        }
    }

    private void moveUnitSpace() {
        switch (directionFacing) {
            case EAST:
                currentCoordinates.y++;
                break;
            case WEST:
                currentCoordinates.y--;
                break;
            case NORTH:
                currentCoordinates.x--;
                break;
            case SOUTH:
                currentCoordinates.x++;
                break;
            default:
        }
    }
}
