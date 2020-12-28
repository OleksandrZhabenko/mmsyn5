-- |
-- Module      :  Data.List.InnToOut.Basic
-- Copyright   :  (c) OleksandrZhabenko 2019-2020
-- License     :  MIT
-- Maintainer  :  olexandr543@yahoo.com
--
-- Various additional operations on lists
--

module Data.List.InnToOut.Basic 
  (
    -- * Operations to apply a function or two different functions to an element of the outer list (some of them create inner list)  
       mapI
       , mapI2
  ) where

-- | Function that applies additional function @f :: a -> [a]@ to @a@ if @p :: a -> Bool@ and @p a = True@
mapI :: (a -> Bool) -> (a -> [a]) -> [a] -> [a]
mapI p f = concatMap (\x -> if p x then f x else [x])
{-# INLINABLE mapI #-}

-- | Function that applies additional function @f :: a -> b@ to @a@ if @p :: a -> Bool@ and @p a = True@ and otherwise another 
-- function @g :: a -> [b]@ to @[a]@ and combines results to obtain @[b]@
mapI2 :: (a -> Bool) -> (a -> b) -> (a -> [b]) -> [a] -> [b]
mapI2 p f g = concatMap (\x -> if p x then [f x] else g x)
{-# INLINABLE mapI2 #-}

