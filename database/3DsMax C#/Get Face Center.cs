 /*		 * Create a plane on all four-sided (selected) faces in the node referenced by  handleid		 @return bool		 */		public bool convertFacesToPlanes(uint handleid)		{			IGlobal global = Autodesk.Max.GlobalInterface.Instance;			IInterface14 ip = global.COREInterface14;			IINode obj = ip.GetINodeByHandle(handleid).ActualINode;			IObjectState os = obj.ObjectRef.Eval(ip.Time);			// Now grab the object itself.			IObject objOriginal = os.Obj;			// Let's make sure it is a TriObject, which is the typical kind of object with a mesh			if (!objOriginal.IsSubClassOf(global.TriObjectClassID))			{				// If it is NOT, see if we can convert it...				if (objOriginal.CanConvertToType(global.TriObjectClassID) == 1)				{					objOriginal = objOriginal.ConvertToType(ip.Time, global.TriObjectClassID);				}				else				{					return false;				}								}			// Now we should be safe to know it is a TriObject and we can cast it as such.			// An exception will be thrown...			ITriObject triObj = objOriginal as ITriObject;			//IPolyObject triObj = objOriginal as IPolyObject;			IMesh mesh = triObj.Mesh as IMesh;			IBitArray facearray = mesh.FaceSel; //Should be a bitarray of selected faces			//!TODO... if count == 0 then use all polygons			/*See if any faces are selected*/			if (facearray.AnyBitSet.Equals(true)) {								int faceCount = facearray.Size;				/*				int time = (int)1;				int numFaces ;				int numVerts ;								global.GetPolygonCount(time, objOriginal, &numFaces, &numVerts);				*/				/*iterate over selected faces				 				 Uh oh... this is a trimesh... what we really need is the selected Polygon... how to get this in C#?				 				 */				for (int i = 0; i <= (faceCount - 1); i++)				{					IFace face = mesh.Faces[i];					if (face.V.Count() == 4) {						/*But this will never happen in a triMesh*/						IPoint3 v1 = mesh.GetVert((int)(face.GetVert(0)) );						IPoint3 v2 = mesh.GetVert((int)(face.GetVert(1)));						IPoint3 v3 = mesh.GetVert((int)(face.GetVert(2)));						IPoint3 v4 = mesh.GetVert((int)(face.GetVert(3)));					IPoint3 front =  v1.Subtract(v2).Normalize;  					IPoint3  side = v2.Subtract(v3).Normalize;  					IPoint3 up =  mesh.GetFaceNormal(i);					float divNum = (4);					IPoint3 center = v1.Add(v2).Add(v3).Add(v4).DivideBy(divNum);						//IMatrix3 tm =  new IMatrix3(front side up center);						//tm = pretranslate tm [0.5, 0.5, 0]						//face.GetVertIndex()					}				}			} else{				return false;			}			return true;		}