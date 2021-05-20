%% 将变量的变量名转换为字符串
function [ str_varName ] = F_getVarName( var )

    str_varName = sprintf('%s', inputname(1));

end