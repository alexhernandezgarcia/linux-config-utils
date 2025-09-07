# Search and replace
```
grep -rl matchstring somedir/ | xargs sed -i 's/string1/string2/g'
```

# Delete line with pattern
```
grep -rl matchstring somedir/ | xargs sed -i '/string/d'
```

## References

- https://stackoverflow.com/questions/15402770/how-to-search-and-replace-using-grep
- https://www.baeldung.com/linux/delete-lines-containing-string-from-file
