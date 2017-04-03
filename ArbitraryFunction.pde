public interface ArbitraryFunction {
  public abstract void execute ( );
}

// Implementations:

class EmptyFunction implements ArbitraryFunction
{
  public EmptyFunction()
  { }
 
  public void execute( )
  { }
}