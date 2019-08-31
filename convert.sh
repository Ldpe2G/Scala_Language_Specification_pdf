PROJECT_ROOT=$(cd "$(dirname $0)"; pwd)

SCALA_PRODECT_DIR=${PROJECT_ROOT}/scala/spec
RESULT_DIR=pdf
	
ls ${SCALA_PRODECT_DIR} \
	| grep ".md" \
	| grep '^[0-9]\|index' \
	| awk -F ".md" -v scala_path="$SCALA_PRODECT_DIR" -v result_path="$RESULT_DIR" '{print " pandoc " scala_path "/"  $0 " -s -o " result_path "/" $1 ".pdf --pdf-engine=xelatex --standalone"}' \
	| sh
