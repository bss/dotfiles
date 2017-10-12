'use strict';

var _hasOneDeclaration = require('./hasOneDeclaration');

var _hasOneDeclaration2 = _interopRequireDefault(_hasOneDeclaration);

var _isRequireExpression = require('./isRequireExpression');

var _isRequireExpression2 = _interopRequireDefault(_isRequireExpression);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function hasOneRequireDeclaration(node) {
  if (!(0, _hasOneDeclaration2.default)(node)) {
    return false;
  }
  var declaration = node.declarations[0];
  return (0, _isRequireExpression2.default)(declaration.init);
} /*
   * Copyright (c) 2015-present, Facebook, Inc.
   * All rights reserved.
   *
   * This source code is licensed under the license found in the LICENSE file in
   * the root directory of this source tree.
   *
   * 
   */

module.exports = hasOneRequireDeclaration;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uL3NyYy9jb21tb24vdXRpbHMvaGFzT25lUmVxdWlyZURlY2xhcmF0aW9uLmpzIl0sIm5hbWVzIjpbImhhc09uZVJlcXVpcmVEZWNsYXJhdGlvbiIsIm5vZGUiLCJkZWNsYXJhdGlvbiIsImRlY2xhcmF0aW9ucyIsImluaXQiLCJtb2R1bGUiLCJleHBvcnRzIl0sIm1hcHBpbmdzIjoiOztBQVlBOzs7O0FBQ0E7Ozs7OztBQUVBLFNBQVNBLHdCQUFULENBQWtDQyxJQUFsQyxFQUF1RDtBQUNyRCxNQUFJLENBQUMsaUNBQWtCQSxJQUFsQixDQUFMLEVBQThCO0FBQzVCLFdBQU8sS0FBUDtBQUNEO0FBQ0QsTUFBTUMsY0FBY0QsS0FBS0UsWUFBTCxDQUFrQixDQUFsQixDQUFwQjtBQUNBLFNBQU8sbUNBQW9CRCxZQUFZRSxJQUFoQyxDQUFQO0FBQ0QsQyxDQXJCRDs7Ozs7Ozs7OztBQXVCQUMsT0FBT0MsT0FBUCxHQUFpQk4sd0JBQWpCIiwiZmlsZSI6Imhhc09uZVJlcXVpcmVEZWNsYXJhdGlvbi5qcyIsInNvdXJjZXNDb250ZW50IjpbIi8qXG4gKiBDb3B5cmlnaHQgKGMpIDIwMTUtcHJlc2VudCwgRmFjZWJvb2ssIEluYy5cbiAqIEFsbCByaWdodHMgcmVzZXJ2ZWQuXG4gKlxuICogVGhpcyBzb3VyY2UgY29kZSBpcyBsaWNlbnNlZCB1bmRlciB0aGUgbGljZW5zZSBmb3VuZCBpbiB0aGUgTElDRU5TRSBmaWxlIGluXG4gKiB0aGUgcm9vdCBkaXJlY3Rvcnkgb2YgdGhpcyBzb3VyY2UgdHJlZS5cbiAqXG4gKiBAZmxvd1xuICovXG5cbmltcG9ydCB0eXBlIHtOb2RlfSBmcm9tICcuLi90eXBlcy9hc3QnO1xuXG5pbXBvcnQgaGFzT25lRGVjbGFyYXRpb24gZnJvbSAnLi9oYXNPbmVEZWNsYXJhdGlvbic7XG5pbXBvcnQgaXNSZXF1aXJlRXhwcmVzc2lvbiBmcm9tICcuL2lzUmVxdWlyZUV4cHJlc3Npb24nO1xuXG5mdW5jdGlvbiBoYXNPbmVSZXF1aXJlRGVjbGFyYXRpb24obm9kZTogTm9kZSk6IGJvb2xlYW4ge1xuICBpZiAoIWhhc09uZURlY2xhcmF0aW9uKG5vZGUpKSB7XG4gICAgcmV0dXJuIGZhbHNlO1xuICB9XG4gIGNvbnN0IGRlY2xhcmF0aW9uID0gbm9kZS5kZWNsYXJhdGlvbnNbMF07XG4gIHJldHVybiBpc1JlcXVpcmVFeHByZXNzaW9uKGRlY2xhcmF0aW9uLmluaXQpO1xufVxuXG5tb2R1bGUuZXhwb3J0cyA9IGhhc09uZVJlcXVpcmVEZWNsYXJhdGlvbjtcbiJdfQ==