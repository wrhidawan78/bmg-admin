"use strict";(self.webpackChunkbmg_web_app=self.webpackChunkbmg_web_app||[]).push([[47],{7562:function(e,r,n){var t=n(1413),a=n(2791),o=n(6871),l=n(374),c=n(184);r.Z=function(e,r){return function(n){var i=(0,a.useContext)(l.V),s=(0,o.s0)(),u=i.userToken;return(0,a.useEffect)((function(){"undefined"!==typeof window&&(u?-1===(null===r||void 0===r?void 0:r.indexOf(i.userRole))&&s("/403",{replace:!0}):s("/auth",{replace:!0}))}),[u,i.userRole,s]),"undefined"!==typeof window?i.isLoading?(console.log("loading from with auth"),null):(0,c.jsx)(e,(0,t.Z)({},n)):null}}},3047:function(e,r,n){n.r(r);var t=n(3433),a=n(5861),o=n(9439),l=n(7757),c=n.n(l),i=n(2791),s=n(6871),u=n(8735),p=n(9553),d=n(3695),f=n(8164),m=n(7309),h=n(2567),y=n(7562),v=n(3853),b=n(4971),g=n(8206),x=n(4569),Z=n.n(x),E=n(374),j=n(184),w=u.Z.Title,O=u.Z.Text,_=p.Z.Dragger;r.default=(0,y.Z)((function(){var e=(0,i.useState)([]),r=(0,o.Z)(e,2),n=r[0],l=r[1],u=(0,i.useState)(!1),p=(0,o.Z)(u,2),y=p[0],x=p[1],C=(0,i.useContext)(E.V),k=(0,s.s0)(),P=function(){var e=(0,a.Z)(c().mark((function e(){var r;return c().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(x(!0),0!==n.length){e.next=5;break}return d.ZP.warn("Pilih file terlebih dahulu!"),x(!1),e.abrupt("return",null);case 5:return r=[],e.next=8,(0,t.Z)(n).map((function(e){var n=new FormData;return n.append("uploaded_file",e),r.push(Z().post("".concat(g.F,"/api/site/upload/site"),n,{headers:{"Content-Type":"multipart/form-data",Authorization:"bearer ".concat(C.userToken)}}).then((function(r){if(!r)throw new Error;return console.log("response post: ",r.data),l((function(r){return r.filter((function(r){return r.uid!==e.uid}))})),Promise.resolve(!0)})).catch((function(e){return e.response?console.log("error response:",e.response.data.error):console.log("there was an error:",e),Promise.resolve(!1)})))}));case 8:return console.log("Left For Loop"),e.next=11,Promise.all(r).then((function(e){console.log("all request finished!",e);var r=(0,t.Z)(e).filter((function(e){return!0===e}));if(console.log("resultFilter: ",r),r.length!==n.length)return d.ZP.warn("Sebagian file tidak terupload"),x(!1),null;d.ZP.success("Sukses upload file"),x(!1),k("/site")}));case 11:case"end":return e.stop()}}),e)})));return function(){return e.apply(this,arguments)}}();return(0,j.jsxs)("div",{children:[(0,j.jsxs)(f.Z,{style:{margin:"16px 0"},children:[(0,j.jsx)(f.Z.Item,{style:{cursor:"pointer"},onClick:function(){return k("/site")},children:"Site"}),(0,j.jsx)(f.Z.Item,{children:"Upload Site"})]}),(0,j.jsx)("div",{children:(0,j.jsxs)(h.Zb,{children:[(0,j.jsx)(w,{level:3,type:"secondary",style:{marginRight:20,marginBottom:30},children:"Upload Site"}),(0,j.jsxs)(_,{name:"file",height:200,beforeUpload:function(e){return l([].concat((0,t.Z)(n),[e])),!1},onRemove:function(e){return l((function(r){return r.filter((function(r){return r.uid!==e.uid}))}))},children:[(0,j.jsx)("div",{children:(0,j.jsx)(v.Yjd,{size:30,color:b.XR})}),(0,j.jsx)(O,{type:"secondary",children:"Click or drag file to this area to upload"})]}),(0,j.jsx)(m.Z,{type:"primary",shape:"round",icon:(0,j.jsx)(v.Yjd,{}),size:"large",style:{marginTop:20},onClick:P,loading:y,children:"Upload"})]})})]})}))},8164:function(e,r,n){n.d(r,{Z:function(){return O}});var t=n(7462),a=n(4942),o=n(3433),l=n(2791),c=n(1694),i=n.n(c),s=n(5501),u=n(7295),p=n(3950),d=n(9077),f=function(e,r){var n={};for(var t in e)Object.prototype.hasOwnProperty.call(e,t)&&r.indexOf(t)<0&&(n[t]=e[t]);if(null!=e&&"function"===typeof Object.getOwnPropertySymbols){var a=0;for(t=Object.getOwnPropertySymbols(e);a<t.length;a++)r.indexOf(t[a])<0&&Object.prototype.propertyIsEnumerable.call(e,t[a])&&(n[t[a]]=e[t[a]])}return n},m=function(e){var r,n,a=e.prefixCls,o=e.separator,c=void 0===o?"/":o,i=e.children,s=e.overlay,m=e.dropdownProps,h=f(e,["prefixCls","separator","children","overlay","dropdownProps"]),y=(0,l.useContext(d.E_).getPrefixCls)("breadcrumb",a);return r="href"in h?l.createElement("a",(0,t.Z)({className:"".concat(y,"-link")},h),i):l.createElement("span",(0,t.Z)({className:"".concat(y,"-link")},h),i),n=r,r=s?l.createElement(p.Z,(0,t.Z)({overlay:s,placement:"bottomCenter"},m),l.createElement("span",{className:"".concat(y,"-overlay-link")},n,l.createElement(u.Z,null))):n,i?l.createElement("span",null,r,c&&l.createElement("span",{className:"".concat(y,"-separator")},c)):null};m.__ANT_BREADCRUMB_ITEM=!0;var h=m,y=function(e){var r=e.children,n=(0,l.useContext(d.E_).getPrefixCls)("breadcrumb");return l.createElement("span",{className:"".concat(n,"-separator")},r||"/")};y.__ANT_BREADCRUMB_SEPARATOR=!0;var v=y,b=n(1839),g=n(4824),x=n(1113),Z=function(e,r){var n={};for(var t in e)Object.prototype.hasOwnProperty.call(e,t)&&r.indexOf(t)<0&&(n[t]=e[t]);if(null!=e&&"function"===typeof Object.getOwnPropertySymbols){var a=0;for(t=Object.getOwnPropertySymbols(e);a<t.length;a++)r.indexOf(t[a])<0&&Object.prototype.propertyIsEnumerable.call(e,t[a])&&(n[t[a]]=e[t[a]])}return n};function E(e,r,n,t){var a=n.indexOf(e)===n.length-1,o=function(e,r){if(!e.breadcrumbName)return null;var n=Object.keys(r).join("|");return e.breadcrumbName.replace(new RegExp(":(".concat(n,")"),"g"),(function(e,n){return r[n]||e}))}(e,r);return a?l.createElement("span",null,o):l.createElement("a",{href:"#/".concat(t.join("/"))},o)}var j=function(e,r){return e=(e||"").replace(/^\//,""),Object.keys(r).forEach((function(n){e=e.replace(":".concat(n),r[n])})),e},w=function(e){var r,n=e.prefixCls,c=e.separator,u=void 0===c?"/":c,p=e.style,f=e.className,m=e.routes,y=e.children,v=e.itemRender,w=void 0===v?E:v,O=e.params,_=void 0===O?{}:O,C=Z(e,["prefixCls","separator","style","className","routes","children","itemRender","params"]),k=l.useContext(d.E_),P=k.getPrefixCls,R=k.direction,N=P("breadcrumb",n);if(m&&m.length>0){var S=[];r=m.map((function(e){var r,n=j(e.path,_);return n&&S.push(n),e.children&&e.children.length&&(r=l.createElement(b.Z,null,e.children.map((function(e){return l.createElement(b.Z.Item,{key:e.path||e.breadcrumbName},w(e,_,m,function(e,r,n){var t=(0,o.Z)(e),a=j(r||"",n);return a&&t.push(a),t}(S,e.path,_)))})))),l.createElement(h,{overlay:r,separator:u,key:n||e.breadcrumbName},w(e,_,m,S))}))}else y&&(r=(0,s.Z)(y).map((function(e,r){return e?((0,g.Z)(e.type&&(!0===e.type.__ANT_BREADCRUMB_ITEM||!0===e.type.__ANT_BREADCRUMB_SEPARATOR),"Breadcrumb","Only accepts Breadcrumb.Item and Breadcrumb.Separator as it's children"),(0,x.Tm)(e,{separator:u,key:r})):e})));var T=i()(N,(0,a.Z)({},"".concat(N,"-rtl"),"rtl"===R),f);return l.createElement("div",(0,t.Z)({className:T,style:p},C),r)};w.Item=h,w.Separator=v;var O=w}}]);
//# sourceMappingURL=47.67a874bd.chunk.js.map