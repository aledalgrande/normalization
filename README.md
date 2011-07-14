# Constraints

* All single dot components of the path must be removed. For example, "foo/./bar" should be normalized to "foo/bar".
* All double dots components of the path must be removed, along with their parent directory.  For example, "foo/bar/../baz" should be normalized to "foo/baz".
* "foo//bar" should be normalized to "foo//bar" (i.e. a no-op).