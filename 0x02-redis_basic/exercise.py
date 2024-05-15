#!/usr/bin/env python3
"""Writing strings to Redis"""
import redis
import uuid
from typing import Union, Optional, Callable


class Cache:
    """Cache class"""

    def __init__(self):
        """Constructor"""
        self._redis = redis.Redis()
        self._redis.flushdb

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Store data in Redis"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    # Reading from Redis and recovering original type
    def get(self, key: str, fn: Optional[Callable] =
            None) -> Union[str, bytes, int, float]:
        """Get data from Redis"""
        value = self._redis.get(key)
        if fn:
            return fn(value)
        return value
    
    def get_str(self, key: str) -> Optional[str]:
        """Get data from Redis as string"""
        return self.get(key, lambda x: x.decode('utf-8'))

    def get_int(self, key: str) -> Optional[int]:
        """Get data from Redis as int"""
        return self.get(key, lambda x: int(x))
