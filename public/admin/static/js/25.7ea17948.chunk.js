"use strict";(self.webpackChunkbmg_web_app=self.webpackChunkbmg_web_app||[]).push([[25],{1058:function(e,r,n){n.r(r),n.d(r,{default:function(){return k}});var t=n(5861),s=n(9439),a=n(7757),o=n.n(a),i=n(2791),l=n(6871),u=n(586),c=n(8735),p=n(3695),g=n(6755),d=n(7496),h=n(7309),m=n(374),x=n(3853),f=n(4971),b=n(2567),Z=n(492),j=n(184),v=u.Z.Content,y=c.Z.Title,w=c.Z.Text,k=function(){var e=(0,i.useState)(""),r=(0,s.Z)(e,2),n=r[0],a=r[1],c=(0,i.useState)(""),k=(0,s.Z)(c,2),P=k[0],C=k[1],S=(0,i.useState)(!1),_=(0,s.Z)(S,2),F=_[0],T=_[1],I=(0,i.useContext)(m.V).signIn,W=(0,l.s0)(),q=function(){var e=(0,t.Z)(o().mark((function e(){var r,t;return o().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(T(!0),n&&P){e.next=5;break}return p.ZP.warning("Form tidak boleh kosong"),T(!1),e.abrupt("return",null);case 5:if(!(P.length<8)){e.next=9;break}return p.ZP.warn("Password panjang minimal 8 karakter"),T(!1),e.abrupt("return",null);case 9:return e.prev=9,e.next=12,I(n,P);case 12:return t=e.sent,p.ZP.success("Hello.. Welcome ".concat(null===(r=t.user)||void 0===r?void 0:r.email)),W("/"),e.abrupt("return",Promise.resolve(t));case 18:if(e.prev=18,e.t0=e.catch(9),!e.t0.response){e.next=25;break}return p.ZP.error("".concat(e.t0.response.data.error.status_code,", ").concat(e.t0.response.data.error.message)),console.log("error response: ",e.t0.response),T(!1),e.abrupt("return",null);case 25:p.ZP.error("Something went wrong, please try again.."),console.log("error signin: ",e.t0),T(!1);case 28:case"end":return e.stop()}}),e,null,[[9,18]])})));return function(){return e.apply(this,arguments)}}();return(0,j.jsxs)(u.Z,{style:{minHeight:"100vh"},children:[(0,j.jsx)(v,{children:(0,j.jsx)("div",{className:"auth-header",children:(0,j.jsxs)(b.Zb,{style:{marginLeft:10,marginRight:10,marginTop:20,minWidth:320},children:[(0,j.jsxs)("div",{className:"auth-header-content",children:[(0,j.jsx)(g.Z,{src:"/bmg_logo.png",width:100,alt:"logobmg"}),(0,j.jsx)(y,{style:{color:f.Lr,fontWeight:"bold",marginTop:20,marginBottom:0},children:"Welcome,"}),(0,j.jsx)(w,{type:"secondary",children:"Sign in to continue!"})]}),(0,j.jsxs)(d.Z,{name:"basic",onFinish:function(e){console.log("Success")},onFinishFailed:function(e){console.log("Failed:",e)},autoComplete:"off",children:[(0,j.jsx)(b.yt,{name:"email",required:!0,message:"Please input your email!",prefix:(0,j.jsx)(x.fzv,{color:"rgba(0,0,0,.25)"}),placeholder:"enter your email",value:n,onChange:function(e){return a(e.target.value)}}),(0,j.jsx)(b.$M,{name:"password",required:!0,message:"Please input your password!",prefix:(0,j.jsx)(x.UIZ,{color:"rgba(0,0,0,.25)"}),placeholder:"enter your password",value:P,onChange:function(e){return C(e.target.value)}}),(0,j.jsx)(d.Z.Item,{children:(0,j.jsx)(h.Z,{type:"primary",shape:"round",icon:(0,j.jsx)(x.t$,{style:{marginRight:"6px"}}),size:"large",onClick:q,loading:F,style:{width:"100%"},htmlType:"submit",children:"Sign In"})})]})]})})}),(0,j.jsx)(Z.Z,{})]})}}}]);
//# sourceMappingURL=25.7ea17948.chunk.js.map