{-# LANGUAGE CPP, TemplateHaskell, KindSignatures, PolyKinds, TypeOperators,
             DataKinds, ScopedTypeVariables, TypeFamilies, GADTs,
             UndecidableInstances #-}
#if __GLASGOW_HASKELL__ >= 707
{-# LANGUAGE AllowAmbiguousTypes #-}   -- GHC #9019
#endif

-----------------------------------------------------------------------------
-- |
-- Module      :  Data.Promotion.Prelude.Base
-- Copyright   :  (C) 2014 Jan Stolarek
-- License     :  BSD-style (see LICENSE)
-- Maintainer  :  Jan Stolarek (jan.stolarek@p.lodz.pl)
-- Stability   :  experimental
-- Portability :  non-portable
--
-- Implements singletonized functions from GHC.Base module.
--
----------------------------------------------------------------------------

module Data.Promotion.Prelude.Base (

  Until,

  -- * Defunctionalization symbols
  UntilSym0, UntilSym1, UntilSym2, UntilSym3,

  -- * Re-exported from Data.Singletons.Prelude.Base
  Foldr, Map, (:++), Otherwise, Id, Const, (:.), Flip, AsTypeOf, Seq,
  FoldrSym0, FoldrSym1, FoldrSym2, FoldrSym3,
  MapSym0, MapSym1, MapSym2,
  (:++$), (:++$$),
  OtherwiseSym0,
  IdSym0, IdSym1,
  ConstSym0, ConstSym1, ConstSym2,
  (:.$), (:.$$), (:.$$$),
  FlipSym0, FlipSym1, FlipSym2,
  AsTypeOfSym0, AsTypeOfSym1, AsTypeOfSym2,
  SeqSym0, SeqSym1, SeqSym2
  ) where

import Data.Singletons.TH
import Data.Singletons.Prelude.Base

$(promoteOnly [d|
  -- Can't promote due to naming conventions limitations.
  -- See: https://github.com/goldfirere/singletons/issues/29
  -- We also don't promote ($!).
  --
  -- ($)                     :: (a -> b) -> a -> b
  -- f $ x                   =  f x

  -- Does not singletoznize. See #30
  until                   :: (a -> Bool) -> (a -> a) -> a -> a
  until p f = go
    where
      go x | p x          = x
           | otherwise    = go (f x)
 |])