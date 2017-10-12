'use strict';

var _FirstNode = require('../utils/FirstNode');

var _FirstNode2 = _interopRequireDefault(_FirstNode);

var _getUndeclaredIdentifiers = require('../utils/getUndeclaredIdentifiers');

var _getUndeclaredIdentifiers2 = _interopRequireDefault(_getUndeclaredIdentifiers);

var _getUndeclaredJSXIdentifiers = require('../utils/getUndeclaredJSXIdentifiers');

var _getUndeclaredJSXIdentifiers2 = _interopRequireDefault(_getUndeclaredJSXIdentifiers);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function addMissingRequires(root, options) {
  var first = _FirstNode2.default.get(root);
  if (!first) {
    return;
  }
  var _first = first; // For flow.

  var moduleMap = options.moduleMap;

  var jsxIdentifiers = (0, _getUndeclaredJSXIdentifiers2.default)(root, options);

  // Add the missing requires.
  (0, _getUndeclaredIdentifiers2.default)(root, options).forEach(function (name) {
    var node = moduleMap.getRequire(name, {
      jsxSuffix: jsxIdentifiers.has(name) ? options.jsxSuffix : undefined,
      sourcePath: options.sourcePath
    });
    _first.insertBefore(node);
  });
} /*
   * Copyright (c) 2015-present, Facebook, Inc.
   * All rights reserved.
   *
   * This source code is licensed under the license found in the LICENSE file in
   * the root directory of this source tree.
   *
   * 
   */

module.exports = addMissingRequires;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uL3NyYy9jb21tb24vcmVxdWlyZXMvYWRkTWlzc2luZ1JlcXVpcmVzLmpzIl0sIm5hbWVzIjpbImFkZE1pc3NpbmdSZXF1aXJlcyIsInJvb3QiLCJvcHRpb25zIiwiZmlyc3QiLCJnZXQiLCJfZmlyc3QiLCJtb2R1bGVNYXAiLCJqc3hJZGVudGlmaWVycyIsImZvckVhY2giLCJub2RlIiwiZ2V0UmVxdWlyZSIsIm5hbWUiLCJqc3hTdWZmaXgiLCJoYXMiLCJ1bmRlZmluZWQiLCJzb3VyY2VQYXRoIiwiaW5zZXJ0QmVmb3JlIiwibW9kdWxlIiwiZXhwb3J0cyJdLCJtYXBwaW5ncyI6Ijs7QUFhQTs7OztBQUNBOzs7O0FBQ0E7Ozs7OztBQUVBLFNBQVNBLGtCQUFULENBQTRCQyxJQUE1QixFQUE4Q0MsT0FBOUMsRUFBNEU7QUFDMUUsTUFBTUMsUUFBUSxvQkFBVUMsR0FBVixDQUFjSCxJQUFkLENBQWQ7QUFDQSxNQUFJLENBQUNFLEtBQUwsRUFBWTtBQUNWO0FBQ0Q7QUFDRCxNQUFNRSxTQUFTRixLQUFmLENBTDBFLENBS3BEOztBQUxvRCxNQU9uRUcsU0FQbUUsR0FPdERKLE9BUHNELENBT25FSSxTQVBtRTs7QUFRMUUsTUFBTUMsaUJBQWlCLDJDQUE0Qk4sSUFBNUIsRUFBa0NDLE9BQWxDLENBQXZCOztBQUVBO0FBQ0EsMENBQXlCRCxJQUF6QixFQUErQkMsT0FBL0IsRUFBd0NNLE9BQXhDLENBQWdELGdCQUFRO0FBQ3RELFFBQU1DLE9BQU9ILFVBQVVJLFVBQVYsQ0FBcUJDLElBQXJCLEVBQTJCO0FBQ3RDQyxpQkFBV0wsZUFBZU0sR0FBZixDQUFtQkYsSUFBbkIsSUFBMkJULFFBQVFVLFNBQW5DLEdBQStDRSxTQURwQjtBQUV0Q0Msa0JBQVliLFFBQVFhO0FBRmtCLEtBQTNCLENBQWI7QUFJQVYsV0FBT1csWUFBUCxDQUFvQlAsSUFBcEI7QUFDRCxHQU5EO0FBT0QsQyxDQW5DRDs7Ozs7Ozs7OztBQXFDQVEsT0FBT0MsT0FBUCxHQUFpQmxCLGtCQUFqQiIsImZpbGUiOiJhZGRNaXNzaW5nUmVxdWlyZXMuanMiLCJzb3VyY2VzQ29udGVudCI6WyIvKlxuICogQ29weXJpZ2h0IChjKSAyMDE1LXByZXNlbnQsIEZhY2Vib29rLCBJbmMuXG4gKiBBbGwgcmlnaHRzIHJlc2VydmVkLlxuICpcbiAqIFRoaXMgc291cmNlIGNvZGUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIGxpY2Vuc2UgZm91bmQgaW4gdGhlIExJQ0VOU0UgZmlsZSBpblxuICogdGhlIHJvb3QgZGlyZWN0b3J5IG9mIHRoaXMgc291cmNlIHRyZWUuXG4gKlxuICogQGZsb3dcbiAqL1xuXG5pbXBvcnQgdHlwZSB7Q29sbGVjdGlvbn0gZnJvbSAnLi4vdHlwZXMvYXN0JztcbmltcG9ydCB0eXBlIHtTb3VyY2VPcHRpb25zfSBmcm9tICcuLi9vcHRpb25zL1NvdXJjZU9wdGlvbnMnO1xuXG5pbXBvcnQgRmlyc3ROb2RlIGZyb20gJy4uL3V0aWxzL0ZpcnN0Tm9kZSc7XG5pbXBvcnQgZ2V0VW5kZWNsYXJlZElkZW50aWZpZXJzIGZyb20gJy4uL3V0aWxzL2dldFVuZGVjbGFyZWRJZGVudGlmaWVycyc7XG5pbXBvcnQgZ2V0VW5kZWNsYXJlZEpTWElkZW50aWZpZXJzIGZyb20gJy4uL3V0aWxzL2dldFVuZGVjbGFyZWRKU1hJZGVudGlmaWVycyc7XG5cbmZ1bmN0aW9uIGFkZE1pc3NpbmdSZXF1aXJlcyhyb290OiBDb2xsZWN0aW9uLCBvcHRpb25zOiBTb3VyY2VPcHRpb25zKTogdm9pZCB7XG4gIGNvbnN0IGZpcnN0ID0gRmlyc3ROb2RlLmdldChyb290KTtcbiAgaWYgKCFmaXJzdCkge1xuICAgIHJldHVybjtcbiAgfVxuICBjb25zdCBfZmlyc3QgPSBmaXJzdDsgLy8gRm9yIGZsb3cuXG5cbiAgY29uc3Qge21vZHVsZU1hcH0gPSBvcHRpb25zO1xuICBjb25zdCBqc3hJZGVudGlmaWVycyA9IGdldFVuZGVjbGFyZWRKU1hJZGVudGlmaWVycyhyb290LCBvcHRpb25zKTtcblxuICAvLyBBZGQgdGhlIG1pc3NpbmcgcmVxdWlyZXMuXG4gIGdldFVuZGVjbGFyZWRJZGVudGlmaWVycyhyb290LCBvcHRpb25zKS5mb3JFYWNoKG5hbWUgPT4ge1xuICAgIGNvbnN0IG5vZGUgPSBtb2R1bGVNYXAuZ2V0UmVxdWlyZShuYW1lLCB7XG4gICAgICBqc3hTdWZmaXg6IGpzeElkZW50aWZpZXJzLmhhcyhuYW1lKSA/IG9wdGlvbnMuanN4U3VmZml4IDogdW5kZWZpbmVkLFxuICAgICAgc291cmNlUGF0aDogb3B0aW9ucy5zb3VyY2VQYXRoLFxuICAgIH0pO1xuICAgIF9maXJzdC5pbnNlcnRCZWZvcmUobm9kZSk7XG4gIH0pO1xufVxuXG5tb2R1bGUuZXhwb3J0cyA9IGFkZE1pc3NpbmdSZXF1aXJlcztcbiJdfQ==