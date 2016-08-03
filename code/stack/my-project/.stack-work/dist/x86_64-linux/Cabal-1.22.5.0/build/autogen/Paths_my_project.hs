module Paths_my_project (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/may0/workspace/haskell.note/code/stack/my-project/.stack-work/install/x86_64-linux/lts-6.9/7.10.3/bin"
libdir     = "/home/may0/workspace/haskell.note/code/stack/my-project/.stack-work/install/x86_64-linux/lts-6.9/7.10.3/lib/x86_64-linux-ghc-7.10.3/my-project-0.1.0.0-9W4PBtK1ft0AiLCld98jkt"
datadir    = "/home/may0/workspace/haskell.note/code/stack/my-project/.stack-work/install/x86_64-linux/lts-6.9/7.10.3/share/x86_64-linux-ghc-7.10.3/my-project-0.1.0.0"
libexecdir = "/home/may0/workspace/haskell.note/code/stack/my-project/.stack-work/install/x86_64-linux/lts-6.9/7.10.3/libexec"
sysconfdir = "/home/may0/workspace/haskell.note/code/stack/my-project/.stack-work/install/x86_64-linux/lts-6.9/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "my_project_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "my_project_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "my_project_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "my_project_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "my_project_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
