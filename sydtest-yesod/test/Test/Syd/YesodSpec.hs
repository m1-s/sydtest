module Test.Syd.YesodSpec (spec) where

import Network.HTTP.Types.Status
import Test.Syd
import Test.Syd.Yesod
import Test.Syd.Yesod.App

spec :: Spec
spec = yesodSpec withApp $
  yit "responds 200 OK to GET /" $ do
    r <- get HomeR
    liftIO $ responseStatus r `shouldBe` ok200

withApp :: (App -> IO ()) -> IO ()
withApp func = func App