-- ik ts aint obf hard thats js the auth message so idgaf 

local _genv=(type(getgenv)=="function" and getgenv())or(type(getfenv)=="function" and getfenv(0))or _G
local _env=setmetatable({print=print,warn=warn,error=error,assert=assert,type=type,typeof=typeof,tostring=tostring,tonumber=tonumber,pcall=pcall,xpcall=xpcall,select=select,unpack=unpack,pairs=pairs,ipairs=ipairs,next=next,rawget=rawget,rawset=rawset,rawequal=rawequal,rawlen=rawlen,setmetatable=setmetatable,getmetatable=getmetatable,string=string,table=table,math=math,bit32=bit32,coroutine=coroutine,os=os,debug=debug,utf8=utf8,buffer=buffer,game=game,workspace=workspace,script=script,Instance=Instance,Vector3=Vector3,Vector2=Vector2,CFrame=CFrame,Color3=Color3,BrickColor=BrickColor,UDim=UDim,UDim2=UDim2,Enum=Enum,Ray=Ray,Region3=Region3,Rect=Rect,TweenInfo=TweenInfo,NumberSequence=NumberSequence,ColorSequence=ColorSequence,NumberRange=NumberRange,Random=Random,DateTime=DateTime,RaycastParams=RaycastParams,OverlapParams=OverlapParams,tick=tick,time=time,wait=wait,task=task,spawn=spawn,delay=delay,require=require,loadstring=loadstring,load=load,getfenv=getfenv,setfenv=setfenv,newproxy=newproxy,_G=_G,shared=shared,settings=settings,stats=stats,UserSettings=UserSettings,version=version},{__index=function(_,k) local ok,v=pcall(function() return _genv[k] end)
if ok then return v end
return nil end})

local function _run(K,code,_env,protos,initLocals,upvalues,varargs)
protos=protos or {}
upvalues=upvalues or {}
varargs=varargs or {}
local varargCount=varargs.n or #varargs
local function resolveK(_idx) return K[_idx] end
local stack={}
local locals={}
local callBases={}
local stackTop=0
local localBoxes={}
local ip=1
local callBaseTop=0
local _doReturn=false
local _retFromStack=false
local _retBase=0
local _retTop=0
local _retN=0
local _retPack=nil
local ctxBit=0
if initLocals then for _k=0,(initLocals.n or 0)-1 do locals[_k]=initLocals[_k] end end
local function push(v) stackTop=stackTop+1
stack[stackTop]=v end
local function pop() local v=stack[stackTop]
stack[stackTop]=nil
stackTop=stackTop-1
return v end
local function top() return stack[stackTop] end
local function getLocal(slot) local box=localBoxes[slot]
if box then return box[1] end
return locals[slot] end
local function setLocal(slot,val) local box=localBoxes[slot]
if box then box[1]=val else locals[slot]=val end end
local function boxLocal(slot) if not localBoxes[slot] then localBoxes[slot]={locals[slot]} end
return localBoxes[slot] end
local function getMM(obj,name) local ok,mt=pcall(getmetatable,obj)
if ok and mt and type(mt)=="table" then return rawget(mt,name) end
return nil end
local function arithMM(a,b,op,name) if type(a)=="number" and type(b)=="number" then return op(a,b) end
local ok,r=pcall(op,a,b)
if ok then return r end
local mm=getMM(a,name) or getMM(b,name)
if mm then return mm(a,b) end
return op(a,b) end
local handlers={}
handlers[0]=function() end
handlers[1]=function() push(nil) end
handlers[2]=function() push(true) end
handlers[3]=function() push(false) end
handlers[4]=function() push(resolveK(code[ip]+1))
ip=ip+1 end
handlers[5]=function() push(getLocal(code[ip]))
ip=ip+1 end
handlers[6]=function() setLocal(code[ip],pop())
ip=ip+1 end
handlers[7]=function() push(_env[resolveK(code[ip]+1)])
ip=ip+1 end
handlers[8]=function() _env[resolveK(code[ip]+1)]=pop()
ip=ip+1 end
handlers[9]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return x+y end,"__add")) end
handlers[10]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return x-y end,"__sub")) end
handlers[11]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return x*y end,"__mul")) end
handlers[12]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return x/y end,"__div")) end
handlers[13]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return x%y end,"__mod")) end
handlers[14]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return x^y end,"__pow")) end
handlers[15]=function() local b,a=pop(),pop()
local ok,r=pcall(function() return a..b end)
if ok then push(r) else push(tostring(a)..tostring(b)) end end
handlers[16]=function() local b,a=pop(),pop()
push(a==b) end
handlers[17]=function() local b,a=pop(),pop()
push(a~=b) end
handlers[18]=function() local b,a=pop(),pop()
push(a<b) end
handlers[19]=function() local b,a=pop(),pop()
push(a<=b) end
handlers[20]=function() local b,a=pop(),pop()
push(a>b) end
handlers[21]=function() local b,a=pop(),pop()
push(a>=b) end
handlers[22]=function() local b,a=pop(),pop()
push(a and b) end
handlers[23]=function() local b,a=pop(),pop()
push(a or b) end
handlers[24]=function() push(not pop()) end
handlers[25]=function() push(-pop()) end
handlers[26]=function() push(#pop()) end
handlers[27]=function() push({}) end
handlers[28]=function() local k,t=pop(),pop()
push(t[k]) end
handlers[29]=function() local v,k,t=pop(),pop(),pop()
t[k]=v end
handlers[30]=function() local n=code[ip]
ip=ip+1
local args={}
for i=1,n do args[n-i+1]=pop() end
local f=pop()
if type(f)~="function" then local mm=getMM(f,"__call")
if mm then table.insert(args,1,f)
n=n+1
f=mm else error("attempt to call a "..type(f).." value") end end
local r
if n==0 then r={f()} else r={f(table.unpack(args,1,n))} end
push(r[1]) end
handlers[31]=function() local n=code[ip]
ip=ip+1
_doReturn=true
if n==0 then _retN=0 elseif n>0 then if n>stackTop then n=stackTop end
_retN=n
_retFromStack=true
_retTop=stackTop
_retBase=stackTop-n else _retN=stackTop
_retFromStack=true
_retTop=stackTop
_retBase=0 end end
handlers[32]=function() ip=code[ip]+1 end
handlers[33]=function() local target=code[ip]
ip=ip+1
if not pop() then ip=target+1 end end
handlers[34]=function() local n=code[ip]
ip=ip+1
for _=1,n do pop() end end
handlers[35]=function() local pi=code[ip]
ip=ip+1
local P=protos[pi]
if P then
local _r,Kp,Cp=_run,P.K or K,P.C or {}
local nU={}
if P.U then for ui,ud in ipairs(P.U) do local iL,idx=ud[1],ud[2]
if iL==1 then nU[ui]=boxLocal(idx) else nU[ui]=upvalues[idx+1] end end end
local nP=P.nParams or 0
push(function(...)
local a={...}
local ac=select("#",...)
local L={}
L.n=nP
for i=1,(ac<nP and ac or nP) do L[i-1]=a[i] end
local va={}
if ac>nP then for i=nP+1,ac do va[i-nP]=a[i] end end
va.n=ac-nP
return _r(Kp,Cp,_env,P.P or {},L,nU,va)
end)
else push(nil) end end
handlers[36]=function() push(top()) end
handlers[37]=function() local ui=code[ip]
ip=ip+1
local box=upvalues[ui+1]
push(box and box[1] or nil) end
handlers[38]=function() local ui=code[ip]
ip=ip+1
local box=upvalues[ui+1]
if box then box[1]=pop() else pop() end end
handlers[39]=function() local na=code[ip]
ip=ip+1
local nr=code[ip]
ip=ip+1
local args={}
for i=1,na do args[na-i+1]=pop() end
local f=pop()
if type(f)~="function" then local mm=getMM(f,"__call")
if mm then table.insert(args,1,f)
na=na+1
f=mm else error("attempt to call a "..type(f).." value") end end
local r
if na==0 then r=table.pack(f()) else r=table.pack(f(table.unpack(args,1,na))) end
local rn=nr<0 and r.n or nr
for i=1,rn do push(r[i]) end end
handlers[40]=function() local n=code[ip]
ip=ip+1
if n<0 then for i=1,varargCount do push(varargs[i]) end else for i=1,n do push(varargs[i]) end end end
handlers[41]=function() local n=code[ip]
ip=ip+1
local args={}
for j=n,1,-1 do args[j]=pop() end
local f=pop()
if type(f)~="function" then local mm=getMM(f,"__call")
if mm then table.insert(args,1,f)
n=n+1
f=mm end end
_doReturn=true
_retPack=table.pack(f(table.unpack(args,1,n))) end
handlers[42]=function() local off=code[ip]
ip=ip+1
local step=pop()
local limit=pop()
local init=pop()
push(init)
push(limit)
push(step)
if step>=0 then if init>limit then ip=off+1 end else if init<limit then ip=off+1 end end end
handlers[43]=function() local off=code[ip]
ip=ip+1
local step=stack[stackTop]
local i=stack[stackTop-2]+step
stack[stackTop-2]=i
local limit=stack[stackTop-1]
if step>=0 then if i<=limit then ip=off+1 end else if i>=limit then ip=off+1 end end end
handlers[44]=function() local n=code[ip]
ip=ip+1
local parts={}
for i=1,n do parts[n-i+1]=tostring(pop()) end
push(table.concat(parts)) end
handlers[45]=function() local n=code[ip]
ip=ip+1
for _=1,n do push(nil) end end
handlers[46]=function() callBaseTop=callBaseTop+1
callBases[callBaseTop]=stackTop end
handlers[47]=function() local nr=code[ip]
ip=ip+1
local base=callBases[callBaseTop]
callBaseTop=callBaseTop-1
local f=stack[base+1]
local na=stackTop-base-1
local args={}
for i=1,na do args[i]=stack[base+1+i] end
stackTop=base
if type(f)~="function" then local mm=getMM(f,"__call")
if mm then table.insert(args,1,f)
na=na+1
f=mm else error("attempt to call a "..type(f).." value") end end
local r
if na==0 then r=table.pack(f()) else r=table.pack(f(table.unpack(args,1,na))) end
local rn=nr<0 and r.n or nr
for i=1,rn do push(r[i]) end end
handlers[48]=function() local b,a=pop(),pop()
push(arithMM(a,b,function(x,y) return math.floor(x/y) end,"__idiv")) end
handlers[49]=function() local slot=code[ip]
ip=ip+1
local box=localBoxes[slot]
if box then locals[slot]=box[1]
localBoxes[slot]=nil end end
handlers[50]=function() local startIdx=code[ip]
ip=ip+1
local base=callBases[callBaseTop]
callBaseTop=callBaseTop-1
local tbl=stack[base]
local idx=startIdx
for i=base+1,stackTop do tbl[idx]=stack[i]
idx=idx+1 end
stackTop=base
stack[stackTop]=tbl end
handlers[51]=function() local a=stack[stackTop]
stack[stackTop]=stack[stackTop-1]
stack[stackTop-1]=a end
handlers[52]=function() local nameIdx=code[ip]
ip=ip+1
local methodName=resolveK(nameIdx+1)
local obj=pop()
local method=obj[methodName]
push(obj)
push(method)
local b,a=pop(),pop()
push(b)
push(a) end
handlers[53]=function() local nVars=code[ip]
ip=ip+1
local target=code[ip]
ip=ip+1
local iter=stack[stackTop-2]
local state=stack[stackTop-1]
local ctl=stack[stackTop]
local r={iter(state,ctl)}
for i=1,nVars do push(r[i]) end
if r[1]~=nil then stack[stackTop-nVars]= r[1] else ip=target+1 end end
handlers[54]=function() local n=code[ip]
ip=ip+1
local args={}
for i=1,n do args[n-i+1]=pop() end
local f=pop()
local results
if n==0 then results=table.pack(pcall(f)) else results=table.pack(pcall(f,table.unpack(args,1,n))) end
local ok=results[1]
push(ok)
if ok then for i=2,results.n do push(results[i]) end else push(results[2]) end end
handlers[55]=function() local n=code[ip]
ip=ip+1
local args={}
for i=1,n do args[n-i+1]=pop() end
local handler=pop()
local f=pop()
local results
if n==0 then results=table.pack(xpcall(f,handler)) else results=table.pack(xpcall(f,handler,table.unpack(args,1,n))) end
local ok=results[1]
push(ok)
for i=2,results.n do push(results[i]) end end
handlers[56]=function() local iS=code[ip]
ip=ip+1
local sS=code[ip]
ip=ip+1
local vS=code[ip]
ip=ip+1
local it=getLocal(iS)
if type(it)=="table" then local ok2,mt=pcall(getmetatable,it)
if ok2 and type(mt)=="table" and mt.__iter then local fn=mt.__iter(it)
setLocal(iS,fn) elseif ok2 and type(mt)=="table" and mt.__call then else setLocal(iS,next)
setLocal(sS,it)
setLocal(vS,nil) end end end
handlers[57]=function() local a=code[ip]
ip=ip+1
local b=code[ip]
ip=ip+1
local c=code[ip]
ip=ip+1
setLocal(c,getLocal(a)+getLocal(b)) end
handlers[58]=function() local a=code[ip]
ip=ip+1
local b=code[ip]
ip=ip+1
local c=code[ip]
ip=ip+1
setLocal(c,getLocal(a)-getLocal(b)) end
handlers[59]=function() local a=code[ip]
ip=ip+1
local b=code[ip]
ip=ip+1
local c=code[ip]
ip=ip+1
setLocal(c,getLocal(a)*getLocal(b)) end
handlers[60]=function() local k=code[ip]
ip=ip+1
local s=code[ip]
ip=ip+1
setLocal(s,resolveK(k+1)) end
handlers[61]=function() local a=code[ip]
ip=ip+1
local b=code[ip]
ip=ip+1
setLocal(b,getLocal(a)) end
handlers[62]=function() local a=code[ip]
ip=ip+1
local k=code[ip]
ip=ip+1
local c=code[ip]
ip=ip+1
setLocal(c,getLocal(a)+resolveK(k+1)) end
handlers[63]=function() local a=code[ip]
ip=ip+1
local b=code[ip]
ip=ip+1
local c=code[ip]
ip=ip+1
setLocal(c,getLocal(a)..getLocal(b)) end
handlers[64]=function() local _=stackTop end
handlers[65]=function() local _a=code[ip]
ip=ip+1
local _=stack[_a] or 0 end
handlers[66]=function() local _a=code[ip]
ip=ip+1
local _b=code[ip]
ip=ip+1
local _=bit32.bxor(_a,_b) end
handlers[67]=function() local _a=code[ip]
ip=ip+1
if ctxBit==0 then push(getLocal(_a)) else push(resolveK(_a+1)) end end
while true do
if _doReturn or ip>#code then break end
local op=code[ip]
ip=ip+1
local h=handlers[op]
if h then h() end
end
if _doReturn then
if _retPack then return table.unpack(_retPack,1,_retPack.n or #_retPack) end
if _retFromStack then
if _retN==0 then return end
return table.unpack(stack,_retBase+1,_retTop)
end
return
end
return nil
end
local _IO04={{K={"math","abs","sin",0.5,2.094,4.189,"Color3","fromRGB","floor",255},C={46,7,0,4,1,28,7,0,4,2,28,5,0,4,3,11,39,1,-1,47,1,6,1,46,7,0,4,1,28,7,0,4,2,28,5,0,4,3,11,4,4,9,39,1,-1,47,1,6,2,46,7,0,4,1,28,7,0,4,2,28,5,0,4,3,11,4,5,9,39,1,-1,47,1,6,3,46,7,6,4,7,28,7,0,4,8,28,5,1,4,9,11,30,1,7,0,4,8,28,5,2,4,9,11,30,1,7,0,4,8,28,5,3,4,9,11,39,1,-1,47,-1,31,-1},P={},U=nil,nParams=1},{K={"task","spawn"},C={37,0,5,0,28,33,11,31,0,32,11,37,0,5,0,2,29,7,0,4,1,28,35,1,30,1,34,1,31,0},P={{K={"Parent","TextColor3","tick","task","wait",0.033},C={37,0,36,33,12,34,1,37,0,4,0,28,33,42,37,0,4,1,46,37,1,7,2,39,0,-1,47,1,29,7,3,4,4,28,4,5,30,1,34,1,32,0,37,2,37,0,1,29,31,0},P={},U={{1,0},{0,1},{0,0}},nParams=0}},U={{1,7},{1,8}},nParams=1},{K={"os","date","%H:%M:%S",20,"task","spawn"},C={7,0,4,1,28,4,2,30,1,6,6,4,3,6,7,7,4,4,5,28,35,1,30,1,34,1,31,0},P={{K={1,0,"string","rep","#"," ","math","floor",100,"Text"," -- [","]: [","] (","%) - ","TextColor3","tick","Lerp","Color3","fromRGB",255,"task","wait",0.05,"]: [    ","    ] - "},C={4,0,6,0,37,0,6,1,4,0,6,2,5,2,4,1,20,33,28,5,0,5,1,19,33,209,32,35,5,0,5,1,21,33,209,49,3,5,0,6,3,7,2,4,3,28,4,4,5,3,30,2,6,4,7,2,4,3,28,4,5,37,0,5,3,10,30,2,6,5,7,6,4,7,28,5,3,37,0,12,4,8,11,30,1,6,6,37,1,4,9,37,2,4,10,37,3,4,11,5,4,5,5,4,12,5,6,4,13,37,4,15,15,15,15,15,15,15,15,15,29,37,5,33,142,37,1,4,14,46,37,6,7,15,39,0,-1,47,1,29,32,181,5,3,37,0,12,6,7,37,1,4,14,37,7,36,4,16,28,51,7,17,4,18,28,4,19,4,19,4,19,30,3,4,0,5,7,10,30,3,29,7,20,4,21,28,4,22,30,1,34,1,49,4,49,5,49,6,49,7,5,0,5,2,9,6,0,32,12,37,1,4,9,37,2,4,10,37,3,4,23,37,8,4,24,37,4,15,15,15,15,15,15,29,37,5,33,248,37,9,37,1,30,1,34,1,32,255,37,1,4,14,37,7,29,31,0},P={},U={{1,7},{1,0},{1,6},{1,1},{1,3},{1,5},{0,0},{1,4},{1,2},{0,1}},nParams=0}},U={{1,8},{1,9}},nParams=6},{K={"ipairs","GetChildren","IsA","Frame","FindFirstChildOfClass","TextLabel","Text","find","tag",1,"msg","rainbow","TextColor3","color"},C={46,7,0,5,0,36,4,1,28,51,39,1,-1,47,3,6,3,6,2,6,1,56,1,2,3,49,4,49,5,5,1,5,2,5,3,39,2,2,6,5,6,4,5,4,6,3,5,4,1,17,33,220,5,5,36,4,2,28,51,4,3,30,2,33,208,5,5,36,4,4,28,51,4,5,30,2,6,6,5,6,33,206,7,0,37,0,39,1,3,6,9,6,8,6,7,56,7,8,9,49,4,49,10,5,7,5,8,5,9,39,2,2,6,10,6,4,5,4,6,9,5,4,1,17,33,204,5,6,4,6,28,36,4,7,28,51,5,10,4,8,28,4,9,2,30,4,36,33,171,34,1,5,6,4,6,28,36,4,7,28,51,5,10,4,10,28,4,9,2,30,4,33,202,5,10,4,11,28,33,190,37,1,5,6,30,1,34,1,32,200,5,6,4,12,5,10,4,13,28,29,32,202,32,99,32,206,32,208,49,6,49,7,49,8,49,9,49,10,32,25,31,0},P={},U={{1,6},{1,9}},nParams=1},{K={"ChildAdded","Connect"},C={37,0,5,0,30,1,34,1,5,0,4,0,28,36,4,1,28,51,35,1,30,2,34,1,31,0},P={{K={"IsA","Frame","task","defer"},C={5,0,36,4,0,28,51,4,1,30,2,24,33,18,31,0,32,18,7,2,4,3,28,35,1,30,1,34,1,31,0},P={{K={"FindFirstChildOfClass","TextLabel","ipairs","Text","find","tag",1,"msg","level","color","rainbow"},C={37,0,36,4,0,28,51,4,1,30,2,6,0,5,0,24,33,22,31,0,32,22,37,1,5,0,28,33,33,31,0,32,33,7,2,37,2,39,1,3,6,3,6,2,6,1,56,1,2,3,49,4,49,5,5,1,5,2,5,3,39,2,2,6,5,6,4,5,4,6,3,5,4,1,17,33,169,5,0,4,3,28,36,4,4,28,51,5,5,4,5,28,4,6,2,30,4,36,33,122,34,1,5,0,4,3,28,36,4,4,28,51,5,5,4,7,28,4,6,2,30,4,33,167,37,1,5,0,2,29,37,3,5,0,5,5,4,5,28,5,5,4,8,28,5,5,4,7,28,5,5,4,9,28,5,5,4,10,28,30,6,34,1,31,0,32,167,32,50,31,0},P={},U={{1,0},{0,0},{0,1},{0,2}},nParams=0}},U={{0,1},{0,2},{0,3}},nParams=1}},U={{1,11},{1,5},{1,6},{1,10}},nParams=1},{K={"game","GetService","CoreGui","DevConsoleMaster","DescendantAdded","Connect","FindFirstChild","ClientLog"},C={7,0,36,4,1,28,51,4,2,30,2,4,3,28,6,0,5,0,4,4,28,36,4,5,28,51,35,1,30,2,34,1,5,0,36,4,6,28,51,4,7,2,30,3,6,1,5,1,33,60,37,0,5,1,30,1,34,1,32,60,31,0},P={{K={"Name","ClientLog","task","defer"},C={5,0,4,0,28,4,1,16,33,23,7,2,4,3,28,35,1,30,1,34,1,32,23,31,0},P={{K={},C={37,0,37,1,30,1,34,1,31,0},P={},U={{0,0},{1,0}},nParams=0}},U={{0,0}},nParams=1}},U={{1,12}},nParams=0},{K={"RAINBOW","Color3","fromRGB",200,"os","date","%H:%M:%S","table","insert","tag","level","msg","color","rainbow","print"," -- [","]: [    ","    ] - ","game","GetService","CoreGui","DevConsoleMaster","FindFirstChild","ClientLog","DescendantAdded","Connect"},C={5,0,4,0,16,6,3,5,2,36,24,33,20,34,1,37,0,5,0,28,36,24,33,39,34,1,7,1,4,2,28,4,3,4,3,4,3,30,3,6,2,7,4,4,5,28,4,6,30,1,6,4,7,7,4,8,28,37,1,27,36,4,9,37,2,29,36,4,10,5,0,29,36,4,11,5,1,29,36,4,12,5,2,29,36,4,13,5,3,29,30,2,34,1,7,14,5,4,4,15,37,2,4,16,5,0,4,17,5,1,15,15,15,15,15,15,30,1,34,1,7,18,36,4,19,28,51,4,20,30,2,4,21,28,6,5,35,1,6,6,5,5,36,4,22,28,51,4,23,2,30,3,6,7,5,7,33,168,5,6,5,7,30,1,34,1,32,184,5,5,4,24,28,36,4,25,28,51,35,2,30,2,34,1,31,0},P={{K={"ChildAdded","Connect"},C={1,6,1,5,0,4,0,28,36,4,1,28,51,35,1,39,2,1,6,1,31,0},P={{K={"IsA","Frame","task","defer"},C={5,0,36,4,0,28,51,4,1,30,2,24,33,18,31,0,32,18,7,2,4,3,28,35,1,30,1,34,1,31,0},P={{K={"FindFirstChildOfClass","TextLabel","Text","find",1,"Disconnect"},C={37,0,36,4,0,28,51,4,1,30,2,6,0,5,0,24,33,22,31,0,32,22,5,0,4,2,28,36,4,3,28,51,37,1,4,4,2,30,4,24,33,46,31,0,32,46,5,0,4,2,28,36,4,3,28,51,37,2,4,4,2,30,4,24,33,70,31,0,32,70,37,3,5,0,28,33,81,31,0,32,81,37,3,5,0,2,29,37,4,36,4,5,28,51,30,1,34,1,37,5,5,0,37,1,37,6,37,2,37,7,37,8,30,6,34,1,31,0},P={},U={{1,0},{0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7}},nParams=0}},U={{0,0},{0,1},{0,2},{1,1},{0,3},{0,4},{0,5},{0,6}},nParams=1}},U={{0,2},{1,1},{0,3},{0,4},{1,0},{1,2},{1,3}},nParams=1},{K={"Name","ClientLog","task","defer"},C={5,0,4,0,28,4,1,16,33,23,7,2,4,3,28,35,1,30,1,34,1,32,23,31,0},P={{K={},C={37,0,37,1,30,1,34,1,31,0},P={},U={{0,0},{1,0}},nParams=0}},U={{1,6}},nParams=1}},U={{1,15},{1,6},{1,14},{1,5},{1,10}},nParams=3},{K={"math","abs","sin",0.5,2.094,4.189,"Color3","fromRGB","floor",255},C={46,7,0,4,1,28,7,0,4,2,28,5,0,4,3,11,39,1,-1,47,1,6,1,46,7,0,4,1,28,7,0,4,2,28,5,0,4,3,11,4,4,9,39,1,-1,47,1,6,2,46,7,0,4,1,28,7,0,4,2,28,5,0,4,3,11,4,5,9,39,1,-1,47,1,6,3,46,7,6,4,7,28,7,0,4,8,28,5,1,4,9,11,30,1,7,0,4,8,28,5,2,4,9,11,30,1,7,0,4,8,28,5,3,4,9,11,39,1,-1,47,-1,31,-1},P={},U=nil,nParams=1},{K={"task","spawn"},C={37,0,5,0,28,33,11,31,0,32,11,37,0,5,0,2,29,7,0,4,1,28,35,1,30,1,34,1,31,0},P={{K={"Parent","TextColor3","tick","task","wait",0.033},C={37,0,36,33,12,34,1,37,0,4,0,28,33,42,37,0,4,1,46,37,1,7,2,39,0,-1,47,1,29,7,3,4,4,28,4,5,30,1,34,1,32,0,37,2,37,0,1,29,31,0},P={},U={{1,0},{0,1},{0,0}},nParams=0}},U={{1,7},{1,8}},nParams=1},{K={"os","date","%H:%M:%S",20,"task","spawn"},C={7,0,4,1,28,4,2,30,1,6,6,4,3,6,7,7,4,4,5,28,35,1,30,1,34,1,31,0},P={{K={1,0,"string","rep","#"," ","math","floor",100,"Text"," -- [","]: [","] (","%) - ","TextColor3","tick","Lerp","Color3","fromRGB",255,"task","wait",0.05,"]: [    ","    ] - "},C={4,0,6,0,37,0,6,1,4,0,6,2,5,2,4,1,20,33,28,5,0,5,1,19,33,209,32,35,5,0,5,1,21,33,209,49,3,5,0,6,3,7,2,4,3,28,4,4,5,3,30,2,6,4,7,2,4,3,28,4,5,37,0,5,3,10,30,2,6,5,7,6,4,7,28,5,3,37,0,12,4,8,11,30,1,6,6,37,1,4,9,37,2,4,10,37,3,4,11,5,4,5,5,4,12,5,6,4,13,37,4,15,15,15,15,15,15,15,15,15,29,37,5,33,142,37,1,4,14,46,37,6,7,15,39,0,-1,47,1,29,32,181,5,3,37,0,12,6,7,37,1,4,14,37,7,36,4,16,28,51,7,17,4,18,28,4,19,4,19,4,19,30,3,4,0,5,7,10,30,3,29,7,20,4,21,28,4,22,30,1,34,1,49,4,49,5,49,6,49,7,5,0,5,2,9,6,0,32,12,37,1,4,9,37,2,4,10,37,3,4,23,37,8,4,24,37,4,15,15,15,15,15,15,29,37,5,33,248,37,9,37,1,30,1,34,1,32,255,37,1,4,14,37,7,29,31,0},P={},U={{1,7},{1,0},{1,6},{1,1},{1,3},{1,5},{0,0},{1,4},{1,2},{0,1}},nParams=0}},U={{1,8},{1,9}},nParams=6},{K={"ipairs","GetChildren","IsA","Frame","FindFirstChildOfClass","TextLabel","Text","find","tag",1,"msg","rainbow","TextColor3","color"},C={46,7,0,5,0,36,4,1,28,51,39,1,-1,47,3,6,3,6,2,6,1,56,1,2,3,49,4,49,5,5,1,5,2,5,3,39,2,2,6,5,6,4,5,4,6,3,5,4,1,17,33,220,5,5,36,4,2,28,51,4,3,30,2,33,208,5,5,36,4,4,28,51,4,5,30,2,6,6,5,6,33,206,7,0,37,0,39,1,3,6,9,6,8,6,7,56,7,8,9,49,4,49,10,5,7,5,8,5,9,39,2,2,6,10,6,4,5,4,6,9,5,4,1,17,33,204,5,6,4,6,28,36,4,7,28,51,5,10,4,8,28,4,9,2,30,4,36,33,171,34,1,5,6,4,6,28,36,4,7,28,51,5,10,4,10,28,4,9,2,30,4,33,202,5,10,4,11,28,33,190,37,1,5,6,30,1,34,1,32,200,5,6,4,12,5,10,4,13,28,29,32,202,32,99,32,206,32,208,49,6,49,7,49,8,49,9,49,10,32,25,31,0},P={},U={{1,6},{1,9}},nParams=1},{K={"ChildAdded","Connect"},C={37,0,5,0,30,1,34,1,5,0,4,0,28,36,4,1,28,51,35,1,30,2,34,1,31,0},P={{K={"IsA","Frame","task","defer"},C={5,0,36,4,0,28,51,4,1,30,2,24,33,18,31,0,32,18,7,2,4,3,28,35,1,30,1,34,1,31,0},P={{K={"FindFirstChildOfClass","TextLabel","ipairs","Text","find","tag",1,"msg","level","color","rainbow"},C={37,0,36,4,0,28,51,4,1,30,2,6,0,5,0,24,33,22,31,0,32,22,37,1,5,0,28,33,33,31,0,32,33,7,2,37,2,39,1,3,6,3,6,2,6,1,56,1,2,3,49,4,49,5,5,1,5,2,5,3,39,2,2,6,5,6,4,5,4,6,3,5,4,1,17,33,169,5,0,4,3,28,36,4,4,28,51,5,5,4,5,28,4,6,2,30,4,36,33,122,34,1,5,0,4,3,28,36,4,4,28,51,5,5,4,7,28,4,6,2,30,4,33,167,37,1,5,0,2,29,37,3,5,0,5,5,4,5,28,5,5,4,8,28,5,5,4,7,28,5,5,4,9,28,5,5,4,10,28,30,6,34,1,31,0,32,167,32,50,31,0},P={},U={{1,0},{0,0},{0,1},{0,2}},nParams=0}},U={{0,1},{0,2},{0,3}},nParams=1}},U={{1,11},{1,5},{1,6},{1,10}},nParams=1},{K={"game","GetService","CoreGui","DevConsoleMaster","DescendantAdded","Connect","FindFirstChild","ClientLog"},C={7,0,36,4,1,28,51,4,2,30,2,4,3,28,6,0,5,0,4,4,28,36,4,5,28,51,35,1,30,2,34,1,5,0,36,4,6,28,51,4,7,2,30,3,6,1,5,1,33,60,37,0,5,1,30,1,34,1,32,60,31,0},P={{K={"Name","ClientLog","task","defer"},C={5,0,4,0,28,4,1,16,33,23,7,2,4,3,28,35,1,30,1,34,1,32,23,31,0},P={{K={},C={37,0,37,1,30,1,34,1,31,0},P={},U={{0,0},{1,0}},nParams=0}},U={{0,0}},nParams=1}},U={{1,12}},nParams=0},{K={"RAINBOW","Color3","fromRGB",200,"os","date","%H:%M:%S","table","insert","tag","level","msg","color","rainbow","print"," -- [","]: [    ","    ] - ","game","GetService","CoreGui","DevConsoleMaster","FindFirstChild","ClientLog","DescendantAdded","Connect"},C={5,0,4,0,16,6,3,5,2,36,24,33,20,34,1,37,0,5,0,28,36,24,33,39,34,1,7,1,4,2,28,4,3,4,3,4,3,30,3,6,2,7,4,4,5,28,4,6,30,1,6,4,7,7,4,8,28,37,1,27,36,4,9,37,2,29,36,4,10,5,0,29,36,4,11,5,1,29,36,4,12,5,2,29,36,4,13,5,3,29,30,2,34,1,7,14,5,4,4,15,37,2,4,16,5,0,4,17,5,1,15,15,15,15,15,15,30,1,34,1,7,18,36,4,19,28,51,4,20,30,2,4,21,28,6,5,35,1,6,6,5,5,36,4,22,28,51,4,23,2,30,3,6,7,5,7,33,168,5,6,5,7,30,1,34,1,32,184,5,5,4,24,28,36,4,25,28,51,35,2,30,2,34,1,31,0},P={{K={"ChildAdded","Connect"},C={1,6,1,5,0,4,0,28,36,4,1,28,51,35,1,39,2,1,6,1,31,0},P={{K={"IsA","Frame","task","defer"},C={5,0,36,4,0,28,51,4,1,30,2,24,33,18,31,0,32,18,7,2,4,3,28,35,1,30,1,34,1,31,0},P={{K={"FindFirstChildOfClass","TextLabel","Text","find",1,"Disconnect"},C={37,0,36,4,0,28,51,4,1,30,2,6,0,5,0,24,33,22,31,0,32,22,5,0,4,2,28,36,4,3,28,51,37,1,4,4,2,30,4,24,33,46,31,0,32,46,5,0,4,2,28,36,4,3,28,51,37,2,4,4,2,30,4,24,33,70,31,0,32,70,37,3,5,0,28,33,81,31,0,32,81,37,3,5,0,2,29,37,4,36,4,5,28,51,30,1,34,1,37,5,5,0,37,1,37,6,37,2,37,7,37,8,30,6,34,1,31,0},P={},U={{1,0},{0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7}},nParams=0}},U={{0,0},{0,1},{0,2},{1,1},{0,3},{0,4},{0,5},{0,6}},nParams=1}},U={{0,2},{1,1},{0,3},{0,4},{1,0},{1,2},{1,3}},nParams=1},{K={"Name","ClientLog","task","defer"},C={5,0,4,0,28,4,1,16,33,23,7,2,4,3,28,35,1,30,1,34,1,32,23,31,0},P={{K={},C={37,0,37,1,30,1,34,1,31,0},P={},U={{0,0},{1,0}},nParams=0}},U={{1,6}},nParams=1}},U={{1,15},{1,6},{1,14},{1,5},{1,10}},nParams=3}}
local _0_l3={7,0,36,4,1,28,51,4,2,30,2,6,0,4,3,6,1,4,4,6,2,4,3,6,3,5,3,4,5,20,33,41,5,1,5,2,19,33,109,32,48,5,1,5,2,21,33,109,49,4,5,1,6,4,5,0,36,4,6,28,51,2,7,7,4,8,28,4,9,28,3,7,0,30,5,34,1,5,0,36,4,6,28,51,3,7,7,4,8,28,4,9,28,3,7,0,30,5,34,1,5,1,5,3,9,6,1,32,25,7,10,4,11,28,4,12,30,1,34,1,27,6,5,27,6,6,27,6,7,35,1,6,8,35,2,6,9,35,3,6,10,35,4,6,11,35,5,6,12,35,6,6,13,5,13,30,0,34,1,4,13,6,14,27,36,4,14,7,15,4,16,28,4,5,4,17,4,5,30,3,29,36,4,18,7,15,4,16,28,4,17,4,19,4,19,30,3,29,36,4,20,7,15,4,16,28,4,17,4,21,4,19,30,3,29,36,4,22,7,15,4,16,28,4,23,4,24,4,17,30,3,29,36,4,25,7,15,4,16,28,4,17,4,17,4,17,30,3,29,6,15,35,7,6,16,5,16,4,14,4,26,30,2,34,1,7,0,36,4,1,28,51,4,2,30,2,6,0,4,3,6,17,4,4,6,18,4,3,6,19,5,19,4,5,20,33,306,5,17,5,18,19,33,374,32,313,5,17,5,18,21,33,374,49,20,5,17,6,20,5,0,36,4,6,28,51,2,7,7,4,8,28,4,9,28,3,7,0,30,5,34,1,5,0,36,4,6,28,51,3,7,7,4,8,28,4,9,28,3,7,0,30,5,34,1,5,17,5,19,9,6,17,32,290,7,10,4,11,28,4,12,30,1,34,1,27,6,5,27,6,6,27,6,7,35,8,6,8,35,9,6,9,35,10,6,10,35,11,6,11,35,12,6,12,35,13,6,13,5,13,30,0,34,1,4,13,6,14,27,36,4,14,7,15,4,16,28,4,5,4,17,4,5,30,3,29,36,4,18,7,15,4,16,28,4,17,4,19,4,19,30,3,29,36,4,20,7,15,4,16,28,4,17,4,21,4,19,30,3,29,36,4,22,7,15,4,16,28,4,23,4,24,4,17,30,3,29,36,4,25,7,15,4,16,28,4,17,4,17,4,17,30,3,29,6,15,35,14,6,16,5,16,4,14,4,26,30,2,34,1,31,0}
local _ll_2={"game","GetService","VirtualInputManager",1,2,0,"SendKeyEvent","Enum","KeyCode","F9","task","wait",3,"LuaCrypt","SUCCESS","Color3","fromRGB",255,"FAILED",60,"WARN",200,"INFO",80,160,"RAINBOW","This Script was Protected by LuaCrypt "}
return _run(_ll_2,_0_l3,_env,_IO04)
