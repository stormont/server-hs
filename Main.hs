{-# LANGUAGE OverloadedStrings #-}
import Control.Monad.IO.Class
import Data.Conduit
import Data.Conduit.Network
import qualified Data.ByteString.Char8 as BS

-- Connect using: telnet 127.0.0.1 4000
main :: IO ()
main = runTCPServer (serverSettings 4000 "*") $ \appData ->
  appSource appData $$ awaitForever $ liftIO . BS.putStr

