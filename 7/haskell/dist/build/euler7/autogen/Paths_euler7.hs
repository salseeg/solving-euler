{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_euler7 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/serge/.cabal/bin"
libdir     = "/home/serge/.cabal/lib/x86_64-linux-ghc-8.4.4/euler7-0.1.0.0-6g5suaXgMWKAhHqBawslIN-euler7"
dynlibdir  = "/home/serge/.cabal/lib/x86_64-linux-ghc-8.4.4"
datadir    = "/home/serge/.cabal/share/x86_64-linux-ghc-8.4.4/euler7-0.1.0.0"
libexecdir = "/home/serge/.cabal/libexec/x86_64-linux-ghc-8.4.4/euler7-0.1.0.0"
sysconfdir = "/home/serge/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "euler7_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "euler7_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "euler7_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "euler7_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "euler7_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "euler7_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
