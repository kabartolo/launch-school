# Easy 7: Exercise 6: Staggered Case (Part 2)(20 April 2017)

# Modify the method from the previous exercise so it ignores
# non-alphabetic characters when determining whether it should
# uppercase or lowercase each letter. The non-alphabetic
# characters should still be included in the return value;
# they just don't count when toggling the desired case. 

def staggered_case(string, start_case = :upcase, skip_non_alpha = true)
  current_case = switch_case(start_case)

  string.chars.map do |char|
    next char if (char =~ /[^a-zA-Z]/ && skip_non_alpha)
    current_case = switch_case(current_case)

    char.send(current_case)
  end.join
end

def switch_case(case_option)
  case_option == :upcase ? :downcase : :upcase
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', :upcase, false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', :upcase, false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', :upcase, false) == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('ALL_CAPS', :downcase, false) == 'aLl_cApS'