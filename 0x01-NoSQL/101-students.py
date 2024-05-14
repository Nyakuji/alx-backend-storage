#!/usr/bin/env python3
"""101-students.py"""


def top_students(mongo_collection):
    """Returns all students sorted by average score"""
    return mongo_collection.aggregate([
        {"$unwind": "$scores"},
        {"$group": {
            "_id": "$_id",
            "name": {"$first": "$name"},
            "averageScore": {"$avg": "$scores.score"}
        }},
        {"$sort": {"averageScore": -1}}
    ])
