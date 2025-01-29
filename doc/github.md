# github.md
Some notes about GitHub, GitHub Workflows, etc.

## CACHE_PURGE_KEY
In some workflows, you'll notice `${{ secrets.CACHE_PURGE_KEY }}`. This can be
used to invalidate every cache; that is, force a complete rebuild from scratch.

I typically use this one-liner in bash to get a value:

    dd if=/dev/urandom bs=1 count=64 2>/dev/null | b2sum | cut -c1-16

Output is typically something like:

    0d03319f2ce557e1

Run the command and update the secret to invalidate all the caches.

Note: This isn't really a secret in the traditional sense. We don't care if
people know the unique string to prefix our cache key. It's just a handy spot
to control the cache.

I'm not sure where the idea originated. I first encountered it in the Shiptest
CI workflows and adopted it in my own. I also found another reference to
something similar: https://stackoverflow.com/a/64819132
