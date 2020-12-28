-- |
-- Module      :  Data.List.InnToOut.Unsafe
-- Copyright   :  (c) OleksandrZhabenko 2019-2020
-- License     :  MIT
-- Maintainer  :  olexandr543@yahoo.com
--
-- Various additional operations on lists that have additional intermediate Monads inside. 
-- Like the 'unsafePerformIO' function they can have unpredictable behaviour. Use them ONLY if you surely know what you are doing.
--

module Data.List.InnToOut.Unsafe 
  (
    -- * Unsafe (in general) operations that can lead to intermediate Monads. 
       unsafeMapI22M
       ,unsafeMapI2M2
       ,unsafeMapI2M2M   
       ,unsafeMapI12M
       ,unsafeMapI2M1
  ) where

-- | Unsafe function in which the second intermediate result @c@ is in the @Monad m@. It appears if the predicate @p :: a -> Bool@ is @False@ on @a@.
-- It can have unpredictable behaviour. Use it ONLY if you surely know what you are doing. It's your responsibility to check whether 
-- the code does what you expect.
unsafeMapI22M :: Monad m => (a -> Bool) -> (a -> b) -> (b -> d) -> (a -> m c) -> (m c -> d) -> [a] -> [d]
unsafeMapI22M p f1 g f2 h = map (\x -> if p x then g (f1 x) else h (f2 x)) 
{-# INLINABLE unsafeMapI22M #-}

-- | Unsafe function in which the first intermediate result @b@ is in the @Monad m@. It appears if the predicate @p :: a -> Bool@ is @True@ on @a@.
-- It can have unpredictable behaviour. Use it ONLY if you surely know what you are doing. It's your responsibility to check whether 
-- the code does what you expect.
unsafeMapI2M2 :: Monad m => (a -> Bool) -> (a -> m b) -> (m b -> d) -> (a -> c) -> (c -> d) -> [a] -> [d]
unsafeMapI2M2 p f1 g f2 h = map (\x -> if p x then g (f1 x) else h (f2 x)) 
{-# INLINABLE unsafeMapI2M2 #-}

-- | Unsafe function in which both the intermediate results @b@ and @c@ are in the Monads. They appear whenever the predicate @p :: a -> Bool@ is @True@ or @False@, but 
-- the first one is used if @p a = True@ and the second one -- if @p a = False@.
-- It can have unpredictable behaviour. Use it ONLY if you surely know what you are doing. It's your responsibility to check whether 
-- the code does what you expect.
unsafeMapI2M2M :: (Monad m0, Monad m) => (a -> Bool) -> (a -> m0 b) -> (m0 b -> d) -> (a -> m c) -> (m c -> d) -> [a] -> [d]
unsafeMapI2M2M p f1 g f2 h = map (\x -> if p x then g (f1 x) else h (f2 x)) 
{-# INLINABLE unsafeMapI2M2M #-}

-- | Unsafe function in which the second intermediate result @b@ is in the @Monad m@. It appears if the predicate @p :: a -> Bool@ is @False@ on @a@.
-- It can have unpredictable behaviour. Use it ONLY if you surely know what you are doing. It's your responsibility to check whether 
-- the code does what you expect.
unsafeMapI12M :: Monad m => (a -> Bool) -> (a -> c) -> (a -> m b) -> (m b -> c) -> [a] -> [c]
unsafeMapI12M p f g h = map (\x -> if p x then f x else h (g x)) 
{-# INLINABLE unsafeMapI12M #-}

-- | Unsafe function in which the first intermediate result @b@ is in the @Monad m@. It appears if the predicate @p :: a -> Bool@ is @True@ on @a@.
-- It can have unpredictable behaviour. Use it ONLY if you surely know what you are doing. It's your responsibility to check whether 
-- the code does what you expect.
unsafeMapI2M1 :: Monad m => (a -> Bool) -> (a -> m b) -> (m b -> c) -> (a -> c) -> [a] -> [c]
unsafeMapI2M1 p f g h = map (\x -> if p x then g (f x) else h x) 
{-# INLINABLE unsafeMapI2M1 #-}
