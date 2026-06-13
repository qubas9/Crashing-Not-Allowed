The master branch is protected. Changes are integrated through pull requests only.

# CONTRIBUTION
1. Make a new branch from master into either feature/* , fix/* , or experimental/* . In feature/* and fix/* are branches that will be integrated soon and in experimental/* are branches that may not be integrated at all.
2. Make your changes and test them. Regularly syncing your branch with master is recommended.
3. When finished create a pull request.
4. Pull requests are reviewed one by one. When your pull request enters review, you may be asked to test your changes against the latest dev version in master.
5. If everything is working, your changes will be merged and a dev version will be assigned.
6. When the next release is published, the changes will be part of it. 

# VERSIONING

There are releases and dev versions:
- Releases follow semantic format (vx.x.x). 

- Dev versions use the -dN suffix (vx.x.x-dN) where the semantic versioning part represents the current semantic version, not the version of the next release.
Between releases, the semantic version may change, but only in the following direction:
patch → minor → major 
The N represents the number of dev versions since the latest release.

example:
``` 
    v1.0.0      (release)
    v1.0.1-d1   (added fix)
    v1.0.1-d2   (added fix)
    v1.1.0-d3   (added feature)
    v1.1.0-d4   (added fix)
    v1.1.0      (release)
```