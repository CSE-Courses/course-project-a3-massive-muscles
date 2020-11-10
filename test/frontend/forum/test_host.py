#!/usr/bin/env python3

import os
import sys
import tempfile
import unittest

_dir_ = os.path.dirname(os.path.realpath(__file__))
_root_ = os.path.join(_dir_, '..', '..', '..')

sys.path.append(_root_)

from Application.app import create_app

app = create_app()
app.config['TESTING'] = True


class TestForumCreate(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.db_fd, app.config['DATABASE'] = tempfile.mkstemp()
        cls.client = app.test_client()

    @classmethod
    def tearDownClass(cls):
        os.close(cls.db_fd)
        os.unlink(app.config['DATABASE'])

    def test_forum_endpoint(self):
        res = self.client.get("/web/forum")
        self.assertEqual(res.status_code, 200)

    def test_forum_create_endpoint(self):
        res = self.client.get("/web/forum/create")
        self.assertEqual(res.status_code, 200)

    def test_forum_thread_endpoint(self):
        res = self.client.get("/web/forum/thread/1")
        self.assertEqual(res.status_code, 404)


if __name__ == '__main__':
    unittest.main()
