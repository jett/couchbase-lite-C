import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="CouchbaseLite",
    version="0.0.1",
    author="Couchbase, Inc.",
    author_email="PythonPackage@couchbase.com",
    license="Apache License 2.0",
    description="A Couchbase Lite module for Python",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/couchbaselabs/couchbase-lite-C",
    packages=setuptools.find_packages(),
    install_requires=["cffi>=1.0.0"],
    package_dir={'': '.'},
    package_data={'CouchbaseLite': ['*.so']},
    include_package_data=True,
    python_requires='>=3.2',
)