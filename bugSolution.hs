The solution involves using a monad transformer such as `MaybeT` or `EitherT` to handle potential failures or using `IO` appropriately when needed.  Here is an example using `MaybeT`:

```haskell
import Control.Monad.Trans.Maybe

main :: IO ()
main = do
  result <- runMaybeT $ do
    x <- MaybeT (return $ Just 10)
    y <- MaybeT (return $ Just 20)
    return $ Just (x + y)
  case result of
    Just sum -> print sum
    Nothing -> print "Calculation failed"
```
This example uses `MaybeT` to handle potential failures.  If any step in the computation results in `Nothing`, the entire computation will short-circuit, preventing unexpected behavior.  Replace `MaybeT` with `EitherT` for error handling or simply use a plain `IO` monad for simple, non-failure-prone IO operations.