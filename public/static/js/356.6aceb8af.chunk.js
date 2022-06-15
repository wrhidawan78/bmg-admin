"use strict";(self.webpackChunkbmg_web_app=self.webpackChunkbmg_web_app||[]).push([[356],{7562:function(e,n,t){var r=t(1413),i=t(2791),o=t(6871),a=t(374),l=t(184);n.Z=function(e,n){return function(t){var c=(0,i.useContext)(a.V),s=(0,o.s0)(),u=c.userToken;return(0,i.useEffect)((function(){"undefined"!==typeof window&&(u?-1===(null===n||void 0===n?void 0:n.indexOf(c.userRole))&&s("/403",{replace:!0}):s("/auth",{replace:!0}))}),[u,c.userRole,s]),"undefined"!==typeof window?c.isLoading?(console.log("loading from with auth"),null):(0,l.jsx)(e,(0,r.Z)({},t)):null}}},7356:function(e,n,t){t.r(n),t.d(n,{default:function(){return O}});var r=t(9439),i=t(2791),o=t(6871),a=t(8735),l=t(8164),c=t(6106),s=t(7309),u=t(7496),d=t(5696),f=t(7562),g=t(2567),m=t(3853),h=t(4971),p=t(6208),x=t(5095),Z=t.n(x),y=t(3695),v=t(4980),j=t(1333),w=t(2393),C=t(184),b=function(e){var n=e.visible,t=e.onCancel,o=e.setUpdateData,a=(0,i.useState)(""),l=(0,r.Z)(a,2),c=l[0],d=l[1],f=u.Z.useForm(),h=(0,r.Z)(f,1)[0],x=(0,i.useState)({url:"",data:{},trigger:0}),Z=(0,r.Z)(x,2),b=Z[0],R=Z[1],O=(0,p.u5)(b.url,b.data,b.trigger),I=O.onSuccess,k=O.loading;return(0,i.useEffect)((function(){I.includes("success")&&(y.ZP.success("Berhasil Create Religion ".concat(c)),d(""),h.resetFields(),t(),o(Date.now()))}),[I]),(0,C.jsx)(v.Z,{title:"Create Religion",visible:n,onCancel:t,footer:!1,children:(0,C.jsxs)(u.Z,{form:h,name:"createsite",autoComplete:"off",children:[(0,C.jsx)(g.yt,{label:"Religion",requiredLabel:!0,name:"religion",required:!0,message:"please input religion!",placeholder:"input religion",onChange:function(e){return(0,w.IY)(e,d)}}),(0,C.jsx)(j.Z,{}),(0,C.jsx)(g.Wy,{children:(0,C.jsx)(u.Z.Item,{children:(0,C.jsx)(s.Z,{type:"primary",shape:"round",icon:(0,C.jsx)(m.t$,{style:{marginRight:"6px"}}),onClick:function(){if(!c)return y.ZP.warn("Form tidak boleh kosong"),null;var e={name:c};console.log("data post: ",e),R({url:"employee/religion/add",data:e,trigger:(new Date).getTime()})},loading:k,htmlType:"submit",children:"Create Religion"})})})]})})},R=a.Z.Title,O=(0,f.Z)((function(){var e=(0,i.useState)(0),n=(0,r.Z)(e,2),t=n[0],a=n[1],f=(0,p.KQ)("employee/religion/list",t),x=f.data,y=f.loading,v=(0,i.useState)(""),j=(0,r.Z)(v,2),w=j[0],O=j[1],I=(0,i.useMemo)((function(){return 0===x.length?[]:x.filter((function(e){var n;return null===(n=e.name)||void 0===n?void 0:n.toLowerCase().includes(null===w||void 0===w?void 0:w.toLowerCase())}))}),[x,w]),k=(0,p.qY)(),D=k.isOpen,S=k.onOpen,M=k.onClose,N=(0,o.s0)(),E=(0,i.useRef)(Z()((function(e){return O(e)}),1e3)).current;return(0,C.jsxs)("div",{children:[(0,C.jsxs)(l.Z,{style:{margin:"16px 0"},children:[(0,C.jsx)(l.Z.Item,{style:{cursor:"pointer"},onClick:function(){return N("/user-management")},children:"User Management"}),(0,C.jsx)(l.Z.Item,{children:"Religion"})]}),(0,C.jsx)(b,{visible:D,onCancel:M,setUpdateData:a}),(0,C.jsx)("div",{children:(0,C.jsxs)(g.Zb,{children:[(0,C.jsx)(R,{level:3,type:"secondary",style:{marginRight:20,marginBottom:30},children:"Religion"}),(0,C.jsxs)(c.Z,{gutter:[16,10],children:[(0,C.jsx)(g.lr,{children:(0,C.jsx)(s.Z,{shape:"round",icon:(0,C.jsx)(m.xVi,{style:{marginRight:6}}),onClick:S,children:"New Religion"})}),(0,C.jsx)(g.r$,{children:(0,C.jsx)(u.Z,{name:"searchReligion",autoComplete:"off",children:(0,C.jsx)(g.yt,{name:"search",prefix:(0,C.jsx)(m.jRj,{color:h.wm}),allowClear:!0,placeholder:"serach religion",value:w,onChange:function(e){return E(e.target.value)}})})})]}),(0,C.jsx)("div",{style:{marginTop:"20px"},children:(0,C.jsx)(d.Z,{columns:[{title:"#",dataIndex:"id",width:70},{title:"Religion Name",dataIndex:"name"}],dataSource:I,rowKey:function(e){return e.id},loading:y,scroll:{y:500}})})]})})]})}))},2393:function(e,n,t){t.d(n,{QD:function(){return i},cX:function(){return o},IY:function(){return a},U6:function(){return l}});t(2426);var r=t(5095),i=function(e){return new Intl.NumberFormat("id-ID").format(e)},o=function(e){return new Date(e).toLocaleDateString("id-ID",{year:"numeric",month:"short",day:"numeric"})},a=t.n(r)()((function(e,n){return n(e.target.value)}),500),l=function(e){return"number"===typeof e?e>=1e6?"".concat((e/1e6).toFixed(2)," MM"):e>=1e3?"".concat((e/1e3).toFixed(2)," KM"):"".concat(e," Meter"):e}},1333:function(e,n,t){var r=t(7462),i=t(4942),o=t(2791),a=t(1694),l=t.n(a),c=t(9077),s=function(e,n){var t={};for(var r in e)Object.prototype.hasOwnProperty.call(e,r)&&n.indexOf(r)<0&&(t[r]=e[r]);if(null!=e&&"function"===typeof Object.getOwnPropertySymbols){var i=0;for(r=Object.getOwnPropertySymbols(e);i<r.length;i++)n.indexOf(r[i])<0&&Object.prototype.propertyIsEnumerable.call(e,r[i])&&(t[r[i]]=e[r[i]])}return t};n.Z=function(e){return o.createElement(c.C,null,(function(n){var t,a=n.getPrefixCls,c=n.direction,u=e.prefixCls,d=e.type,f=void 0===d?"horizontal":d,g=e.orientation,m=void 0===g?"center":g,h=e.orientationMargin,p=e.className,x=e.children,Z=e.dashed,y=e.plain,v=s(e,["prefixCls","type","orientation","orientationMargin","className","children","dashed","plain"]),j=a("divider",u),w=m.length>0?"-".concat(m):m,C=!!x,b="left"===m&&null!=h,R="right"===m&&null!=h,O=l()(j,"".concat(j,"-").concat(f),(t={},(0,i.Z)(t,"".concat(j,"-with-text"),C),(0,i.Z)(t,"".concat(j,"-with-text").concat(w),C),(0,i.Z)(t,"".concat(j,"-dashed"),!!Z),(0,i.Z)(t,"".concat(j,"-plain"),!!y),(0,i.Z)(t,"".concat(j,"-rtl"),"rtl"===c),(0,i.Z)(t,"".concat(j,"-no-default-orientation-margin-left"),b),(0,i.Z)(t,"".concat(j,"-no-default-orientation-margin-right"),R),t),p),I=(0,r.Z)((0,r.Z)({},b&&{marginLeft:h}),R&&{marginRight:h});return o.createElement("div",(0,r.Z)({className:O},v,{role:"separator"}),x&&o.createElement("span",{className:"".concat(j,"-inner-text"),style:I},x))}))}},6106:function(e,n,t){var r=t(7545);n.Z=r.Z}}]);
//# sourceMappingURL=356.6aceb8af.chunk.js.map