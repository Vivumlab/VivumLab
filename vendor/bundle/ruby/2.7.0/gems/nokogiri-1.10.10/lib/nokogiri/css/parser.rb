#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require 'nokogiri/css/parser_extras'

module Nokogiri
  module CSS
    class Parser < Racc::Parser


def unescape_css_identifier(identifier)
  identifier.gsub(/\\(?:([^0-9a-fA-F])|([0-9a-fA-F]{1,6})\s?)/){ |m| $1 || [$2.hex].pack('U') }
end

def unescape_css_string(str)
  str.gsub(/\\(?:([^0-9a-fA-F])|([0-9a-fA-F]{1,6})\s?)/) do |m|
    if $1=="\n"
      ''
    else
      $1 || [$2.hex].pack('U')
    end
  end
end
##### State transition tables begin ###

racc_action_table = [
    24,    93,    56,    57,    33,    55,    94,    23,    24,    22,
    12,    93,    33,    27,    35,    52,    44,    22,   -23,    25,
    45,    98,    23,    33,    26,    18,    20,    25,    27,   -23,
    23,    24,    26,    18,    20,    33,    27,    11,    39,    24,
    22,    23,    74,    33,    18,    91,    90,    27,    22,    12,
    25,    24,   -23,    23,    85,    26,    18,    20,    25,    27,
    66,    23,    24,    26,    18,    20,    33,    27,    86,    88,
    51,    22,    89,    92,    24,    26,    56,    87,    95,    60,
    90,    25,    96,    46,    23,    49,    26,    18,    20,    99,
    27,    33,    33,    51,   103,   104,    56,    58,    26,    60,
    93,   106,    33,    33,    33,   109,    39,    39,   110,    23,
    23,   nil,    18,    18,    20,    27,    27,    39,    39,    39,
    23,    23,    23,    18,    18,    18,    27,    27,    27,    33,
    33,   101,   100,   nil,   102,    22,    56,    87,   nil,    60,
    33,   nil,   nil,   nil,    39,    39,   nil,    23,    23,   nil,
    18,    18,    20,    27,    27,    39,    82,    83,    23,    56,
    87,    18,    60,   nil,    27,    82,    83,    78,    79,    80,
   nil,    81,   nil,   nil,   nil,    77,    78,    79,    80,   nil,
    81,     4,     5,    10,    77,     4,     5,    43,   nil,    56,
    87,     6,    60,     8,     7,     6,   nil,     8,     7,     4,
     5,    10,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     6,
   nil,     8,     7 ]

racc_action_check = [
     3,    58,    24,    24,     3,    24,    57,    15,     9,     3,
    64,    57,     9,    15,    11,    24,    18,     9,    58,     3,
    21,    64,     3,    14,     3,     3,     3,     9,     3,    22,
     9,    12,     9,     9,     9,    12,     9,     1,    14,    42,
    12,    14,    45,    42,    14,    55,    55,    14,    42,     1,
    12,    27,    46,    12,    49,    12,    12,    12,    42,    12,
    27,    42,    43,    42,    42,    42,    43,    42,    50,    53,
    27,    43,    54,    56,    23,    27,    51,    51,    59,    51,
    60,    43,    61,    23,    43,    23,    43,    43,    43,    75,
    43,    28,    25,    23,    84,    86,    25,    25,    23,    25,
    87,    91,    29,    30,    31,    94,    28,    25,   106,    28,
    25,   nil,    28,    25,    25,    28,    25,    29,    30,    31,
    29,    30,    31,    29,    30,    31,    29,    30,    31,    32,
    39,    76,    76,   nil,    76,    39,    90,    90,   nil,    90,
    62,   nil,   nil,   nil,    32,    39,   nil,    32,    39,   nil,
    32,    39,    39,    32,    39,    62,    47,    47,    62,    92,
    92,    62,    92,   nil,    62,    48,    48,    47,    47,    47,
   nil,    47,   nil,   nil,   nil,    47,    48,    48,    48,   nil,
    48,     0,     0,     0,    48,    17,    17,    17,   nil,    93,
    93,     0,    93,     0,     0,    17,   nil,    17,    17,    26,
    26,    26,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    26,
   nil,    26,    26 ]

racc_action_pointer = [
   174,    37,   nil,    -2,   nil,   nil,   nil,   nil,   nil,     6,
   nil,    14,    29,   nil,    17,   -17,   nil,   178,     5,   nil,
   nil,    -9,     0,    72,    -8,    86,   192,    49,    85,    96,
    97,    98,   123,   nil,   nil,   nil,   nil,   nil,   nil,   124,
   nil,   nil,    37,    60,   nil,    31,    23,   153,   162,    29,
    39,    66,   nil,    46,    49,    34,    61,    -1,   -11,    55,
    68,    59,   134,   nil,    -2,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    64,   121,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    69,   nil,    84,    88,   nil,   nil,
   126,    94,   149,   179,    92,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    95,   nil,   nil,   nil,
   nil ]

racc_action_default = [
   -75,   -76,    -2,   -24,    -4,    -5,    -6,    -7,    -8,   -24,
   -74,   -76,   -24,    -3,   -47,   -10,   -13,   -17,   -76,   -19,
   -20,   -76,   -22,   -24,   -76,   -24,   -75,   -76,   -53,   -54,
   -55,   -56,   -57,   -58,   -14,   111,    -1,    -9,   -46,   -24,
   -11,   -12,   -24,   -24,   -18,   -76,   -29,   -62,   -62,   -76,
   -76,   -76,   -30,   -76,   -76,   -38,   -39,   -40,   -22,   -76,
   -38,   -76,   -71,   -73,   -76,   -44,   -45,   -48,   -49,   -50,
   -51,   -52,   -15,   -16,   -21,   -76,   -76,   -63,   -64,   -65,
   -66,   -67,   -68,   -69,   -76,   -27,   -76,   -40,   -31,   -32,
   -76,   -43,   -76,   -76,   -76,   -33,   -70,   -72,   -34,   -25,
   -59,   -60,   -61,   -26,   -28,   -35,   -76,   -36,   -37,   -42,
   -41 ]

racc_goto_table = [
    53,    38,    13,     1,    42,    48,    62,    37,    34,    65,
    40,    36,    63,    75,    84,    67,    68,    69,    70,    71,
    62,    41,    50,    47,    54,   nil,    63,   nil,   nil,    64,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    72,    73,   nil,   nil,   nil,   nil,   nil,   nil,    97,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   105,   nil,   107,   108 ]

racc_goto_check = [
    18,    12,     2,     1,     5,     9,     7,     8,     2,     9,
    10,     2,    12,    17,    17,    12,    12,    12,    12,    12,
     7,    11,    15,    16,    19,   nil,    12,   nil,   nil,     1,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     2,     2,   nil,   nil,   nil,   nil,   nil,   nil,    12,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    18,   nil,    18,    18 ]

racc_goto_pointer = [
   nil,     3,    -1,   nil,   nil,   -13,   nil,   -19,    -7,   -18,
    -5,     6,   -13,   nil,   nil,    -1,     0,   -34,   -24,     0,
   nil,   nil,   nil,   nil ]

racc_goto_default = [
   nil,   nil,   nil,     2,     3,     9,    17,    14,   nil,    15,
    31,    30,    16,    29,    19,    21,   nil,   nil,    59,   nil,
    28,    32,    76,    61 ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 32, :_reduce_1,
  1, 32, :_reduce_2,
  2, 32, :_reduce_3,
  1, 36, :_reduce_4,
  1, 36, :_reduce_5,
  1, 36, :_reduce_6,
  1, 36, :_reduce_7,
  1, 36, :_reduce_8,
  2, 37, :_reduce_9,
  1, 37, :_reduce_none,
  2, 37, :_reduce_11,
  2, 37, :_reduce_12,
  1, 37, :_reduce_13,
  2, 34, :_reduce_14,
  3, 33, :_reduce_15,
  3, 33, :_reduce_16,
  1, 33, :_reduce_none,
  2, 44, :_reduce_18,
  1, 38, :_reduce_none,
  1, 38, :_reduce_20,
  3, 45, :_reduce_21,
  1, 45, :_reduce_22,
  1, 46, :_reduce_23,
  0, 46, :_reduce_none,
  4, 42, :_reduce_25,
  4, 42, :_reduce_26,
  3, 42, :_reduce_27,
  3, 47, :_reduce_28,
  1, 47, :_reduce_29,
  2, 40, :_reduce_30,
  3, 40, :_reduce_31,
  3, 40, :_reduce_32,
  3, 40, :_reduce_33,
  3, 40, :_reduce_34,
  3, 49, :_reduce_35,
  3, 49, :_reduce_36,
  3, 49, :_reduce_37,
  1, 49, :_reduce_none,
  1, 49, :_reduce_none,
  1, 49, :_reduce_40,
  4, 50, :_reduce_41,
  3, 50, :_reduce_42,
  2, 50, :_reduce_43,
  2, 41, :_reduce_44,
  2, 41, :_reduce_45,
  1, 39, :_reduce_none,
  0, 39, :_reduce_none,
  2, 43, :_reduce_48,
  2, 43, :_reduce_49,
  2, 43, :_reduce_50,
  2, 43, :_reduce_51,
  2, 43, :_reduce_52,
  1, 43, :_reduce_none,
  1, 43, :_reduce_none,
  1, 43, :_reduce_none,
  1, 43, :_reduce_none,
  1, 43, :_reduce_none,
  1, 51, :_reduce_58,
  2, 48, :_reduce_59,
  2, 48, :_reduce_60,
  2, 48, :_reduce_61,
  0, 48, :_reduce_none,
  1, 53, :_reduce_63,
  1, 53, :_reduce_64,
  1, 53, :_reduce_65,
  1, 53, :_reduce_66,
  1, 53, :_reduce_67,
  1, 53, :_reduce_68,
  1, 53, :_reduce_69,
  3, 52, :_reduce_70,
  1, 54, :_reduce_none,
  2, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 35, :_reduce_none,
  0, 35, :_reduce_none ]

racc_reduce_n = 76

racc_shift_n = 111

racc_token_table = {
  false => 0,
  :error => 1,
  :FUNCTION => 2,
  :INCLUDES => 3,
  :DASHMATCH => 4,
  :LBRACE => 5,
  :HASH => 6,
  :PLUS => 7,
  :GREATER => 8,
  :S => 9,
  :STRING => 10,
  :IDENT => 11,
  :COMMA => 12,
  :NUMBER => 13,
  :PREFIXMATCH => 14,
  :SUFFIXMATCH => 15,
  :SUBSTRINGMATCH => 16,
  :TILDE => 17,
  :NOT_EQUAL => 18,
  :SLASH => 19,
  :DOUBLESLASH => 20,
  :NOT => 21,
  :EQUAL => 22,
  :RPAREN => 23,
  :LSQUARE => 24,
  :RSQUARE => 25,
  :HAS => 26,
  "." => 27,
  "*" => 28,
  "|" => 29,
  ":" => 30 }

racc_nt_base = 31

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "FUNCTION",
  "INCLUDES",
  "DASHMATCH",
  "LBRACE",
  "HASH",
  "PLUS",
  "GREATER",
  "S",
  "STRING",
  "IDENT",
  "COMMA",
  "NUMBER",
  "PREFIXMATCH",
  "SUFFIXMATCH",
  "SUBSTRINGMATCH",
  "TILDE",
  "NOT_EQUAL",
  "SLASH",
  "DOUBLESLASH",
  "NOT",
  "EQUAL",
  "RPAREN",
  "LSQUARE",
  "RSQUARE",
  "HAS",
  "\".\"",
  "\"*\"",
  "\"|\"",
  "\":\"",
  "$start",
  "selector",
  "simple_selector_1toN",
  "prefixless_combinator_selector",
  "optional_S",
  "combinator",
  "simple_selector",
  "element_name",
  "hcap_0toN",
  "function",
  "pseudo",
  "attrib",
  "hcap_1toN",
  "class",
  "namespaced_ident",
  "namespace",
  "attrib_name",
  "attrib_val_0or1",
  "expr",
  "nth",
  "attribute_id",
  "negation",
  "eql_incl_dash",
  "negation_arg" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
        result = [val.first, val.last].flatten

    result
end

def _reduce_2(val, _values, result)
 result = val.flatten
    result
end

def _reduce_3(val, _values, result)
 result = [val.last].flatten
    result
end

def _reduce_4(val, _values, result)
 result = :DIRECT_ADJACENT_SELECTOR
    result
end

def _reduce_5(val, _values, result)
 result = :CHILD_SELECTOR
    result
end

def _reduce_6(val, _values, result)
 result = :FOLLOWING_SELECTOR
    result
end

def _reduce_7(val, _values, result)
 result = :DESCENDANT_SELECTOR
    result
end

def _reduce_8(val, _values, result)
 result = :CHILD_SELECTOR
    result
end

def _reduce_9(val, _values, result)
        result =  if val[1].nil?
                    val.first
                  else
                    Node.new(:CONDITIONAL_SELECTOR, [val.first, val[1]])
                  end

    result
end

# reduce 10 omitted

def _reduce_11(val, _values, result)
        result = Node.new(:CONDITIONAL_SELECTOR, val)

    result
end

def _reduce_12(val, _values, result)
        result = Node.new(:CONDITIONAL_SELECTOR, val)

    result
end

def _reduce_13(val, _values, result)
        result = Node.new(:CONDITIONAL_SELECTOR,
          [Node.new(:ELEMENT_NAME, ['*']), val.first]
        )

    result
end

def _reduce_14(val, _values, result)
        result = Node.new(val.first, [nil, val.last])

    result
end

def _reduce_15(val, _values, result)
        result = Node.new(val[1], [val.first, val.last])

    result
end

def _reduce_16(val, _values, result)
        result = Node.new(:DESCENDANT_SELECTOR, [val.first, val.last])

    result
end

# reduce 17 omitted

def _reduce_18(val, _values, result)
 result = Node.new(:CLASS_CONDITION, [unescape_css_identifier(val[1])])
    result
end

# reduce 19 omitted

def _reduce_20(val, _values, result)
 result = Node.new(:ELEMENT_NAME, val)
    result
end

def _reduce_21(val, _values, result)
        result = Node.new(:ELEMENT_NAME,
          [[val.first, val.last].compact.join(':')]
        )

    result
end

def _reduce_22(val, _values, result)
        name = @namespaces.key?('xmlns') ? "xmlns:#{val.first}" : val.first
        result = Node.new(:ELEMENT_NAME, [name])

    result
end

def _reduce_23(val, _values, result)
 result = val[0]
    result
end

# reduce 24 omitted

def _reduce_25(val, _values, result)
        result = Node.new(:ATTRIBUTE_CONDITION,
          [val[1]] + (val[2] || [])
        )

    result
end

def _reduce_26(val, _values, result)
        result = Node.new(:ATTRIBUTE_CONDITION,
          [val[1]] + (val[2] || [])
        )

    result
end

def _reduce_27(val, _values, result)
        # Non standard, but hpricot supports it.
        result = Node.new(:PSEUDO_CLASS,
          [Node.new(:FUNCTION, ['nth-child(', val[1]])]
        )

    result
end

def _reduce_28(val, _values, result)
        result = Node.new(:ELEMENT_NAME,
          [[val.first, val.last].compact.join(':')]
        )

    result
end

def _reduce_29(val, _values, result)
        # Default namespace is not applied to attributes.
        # So we don't add prefix "xmlns:" as in namespaced_ident.
        result = Node.new(:ELEMENT_NAME, [val.first])

    result
end

def _reduce_30(val, _values, result)
        result = Node.new(:FUNCTION, [val.first.strip])

    result
end

def _reduce_31(val, _values, result)
        result = Node.new(:FUNCTION, [val.first.strip, val[1]].flatten)

    result
end

def _reduce_32(val, _values, result)
        result = Node.new(:FUNCTION, [val.first.strip, val[1]].flatten)

    result
end

def _reduce_33(val, _values, result)
        result = Node.new(:FUNCTION, [val.first.strip, val[1]].flatten)

    result
end

def _reduce_34(val, _values, result)
        result = Node.new(:FUNCTION, [val.first.strip, val[1]].flatten)

    result
end

def _reduce_35(val, _values, result)
 result = [val.first, val.last]
    result
end

def _reduce_36(val, _values, result)
 result = [val.first, val.last]
    result
end

def _reduce_37(val, _values, result)
 result = [val.first, val.last]
    result
end

# reduce 38 omitted

# reduce 39 omitted

def _reduce_40(val, _values, result)
        case val[0]
        when 'even'
          result = Node.new(:NTH, ['2','n','+','0'])
        when 'odd'
          result = Node.new(:NTH, ['2','n','+','1'])
        when 'n'
          result = Node.new(:NTH, ['1','n','+','0'])
        else
          # This is not CSS standard.  It allows us to support this:
          # assert_xpath("//a[foo(., @href)]", @parser.parse('a:foo(@href)'))
          # assert_xpath("//a[foo(., @a, b)]", @parser.parse('a:foo(@a, b)'))
          # assert_xpath("//a[foo(., a, 10)]", @parser.parse('a:foo(a, 10)'))
          result = val
        end

    result
end

def _reduce_41(val, _values, result)
        if val[1] == 'n'
          result = Node.new(:NTH, val)
        else
          raise Racc::ParseError, "parse error on IDENT '#{val[1]}'"
        end

    result
end

def _reduce_42(val, _values, result)
               # n+3, -n+3
        if val[0] == 'n'
          val.unshift("1")
          result = Node.new(:NTH, val)
        elsif val[0] == '-n'
          val[0] = 'n'
          val.unshift("-1")
          result = Node.new(:NTH, val)
        else
          raise Racc::ParseError, "parse error on IDENT '#{val[1]}'"
        end

    result
end

def _reduce_43(val, _values, result)
                    # 5n, -5n, 10n-1
        n = val[1]
        if n[0, 2] == 'n-'
          val[1] = 'n'
          val << "-"
          # b is contained in n as n is the string "n-b"
          val << n[2, n.size]
          result = Node.new(:NTH, val)
        elsif n == 'n'
          val << "+"
          val << "0"
          result = Node.new(:NTH, val)
        else
          raise Racc::ParseError, "parse error on IDENT '#{val[1]}'"
        end

    result
end

def _reduce_44(val, _values, result)
        result = Node.new(:PSEUDO_CLASS, [val[1]])

    result
end

def _reduce_45(val, _values, result)
 result = Node.new(:PSEUDO_CLASS, [val[1]])
    result
end

# reduce 46 omitted

# reduce 47 omitted

def _reduce_48(val, _values, result)
        result = Node.new(:COMBINATOR, val)

    result
end

def _reduce_49(val, _values, result)
        result = Node.new(:COMBINATOR, val)

    result
end

def _reduce_50(val, _values, result)
        result = Node.new(:COMBINATOR, val)

    result
end

def _reduce_51(val, _values, result)
        result = Node.new(:COMBINATOR, val)

    result
end

def _reduce_52(val, _values, result)
        result = Node.new(:COMBINATOR, val)

    result
end

# reduce 53 omitted

# reduce 54 omitted

# reduce 55 omitted

# reduce 56 omitted

# reduce 57 omitted

def _reduce_58(val, _values, result)
 result = Node.new(:ID, [unescape_css_identifier(val.first)])
    result
end

def _reduce_59(val, _values, result)
 result = [val.first, unescape_css_identifier(val[1])]
    result
end

def _reduce_60(val, _values, result)
 result = [val.first, unescape_css_string(val[1])]
    result
end

def _reduce_61(val, _values, result)
 result = [val.first, val[1]]
    result
end

# reduce 62 omitted

def _reduce_63(val, _values, result)
 result = :equal
    result
end

def _reduce_64(val, _values, result)
 result = :prefix_match
    result
end

def _reduce_65(val, _values, result)
 result = :suffix_match
    result
end

def _reduce_66(val, _values, result)
 result = :substring_match
    result
end

def _reduce_67(val, _values, result)
 result = :not_equal
    result
end

def _reduce_68(val, _values, result)
 result = :includes
    result
end

def _reduce_69(val, _values, result)
 result = :dash_match
    result
end

def _reduce_70(val, _values, result)
        result = Node.new(:NOT, [val[1]])

    result
end

# reduce 71 omitted

# reduce 72 omitted

# reduce 73 omitted

# reduce 74 omitted

# reduce 75 omitted

def _reduce_none(val, _values, result)
  val[0]
end

    end   # class Parser
    end   # module CSS
  end   # module Nokogiri
